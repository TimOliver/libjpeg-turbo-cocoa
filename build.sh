#!/bin/sh

# Print a list of all of the build options this script supports
usage() {
cat <<EOF
Usage: sh $0 command [argument]
command:
  all:              builds all frameworks and packages them
  ios:              builds iOS frameworks
  macos:            builds macOS frameworks
  tvos:             builds tvOS frameworks
  visionos:         builds visionOS frameworks
  package:          zips xcframeworks and computes checksums
EOF
}

# Global values
readonly BASE_PATH=$(pwd)
readonly LIBRARY_URL="https://github.com/libjpeg-turbo/libjpeg-turbo/archive/refs/tags/"
readonly LIBRARY_DIR="libjpeg-turbo"
readonly COMPILER=$(xcode-select -p)"/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang"
readonly OUTPUT_DIR="${BASE_PATH}/output"

# Read the tag from ENV, or default to the last verified stable version
LIBRARY_VERSION="3.1.3"
if [ ! -z "${LIBJPEGTURBO_TAG_VERSION}" ]; then
  LIBRARY_VERSION=${LIBJPEGTURBO_TAG_VERSION}
fi

# Verify Xcode and its build tools are available
readonly XCODE=$(xcodebuild -version | grep Xcode | cut -d " " -f2)
if [ -z "${XCODE}" ]; then
  echo "Xcode not available"
  exit 1
fi

# Pull the latest release version of the library
download_library() {
  URL=${LIBRARY_URL}${LIBRARY_VERSION}".zip"
  ZIP=${LIBRARY_DIR}".zip"

  # Make a directory to store it
  mkdir -p ${LIBRARY_DIR}
  cd ${LIBRARY_DIR}

  # Download the zip
  curl ${URL} -L -o ${ZIP}

  # Extract the files in the zip, but skip the base directory
  bsdtar --strip-components=1 -xf ${ZIP}

  # Delete the zip
  rm ${ZIP}

  # Go back up to the previous directory
  cd ..
}

build() {
  CMAKE_PATH=$1

  cd ${CMAKE_PATH}

  cmake -G"Unix Makefiles" \
    -DCMAKE_TOOLCHAIN_FILE=toolchain.cmake \
    -DCMAKE_SYSTEM_NAME=Darwin \
    -DENABLE_SHARED=ON \
    -DENABLE_STATIC=ON \
    -DCMAKE_INSTALL_NAME_DIR=@rpath \
    -DCMAKE_C_COMPILER=${COMPILER} \
    ../../libjpeg-turbo
  make

  # Copy public headers into the build output so they're always available
  # In libjpeg-turbo 3.x, headers live under src/
  # (turbojpeg API)
  cp ../../libjpeg-turbo/src/turbojpeg.h turbojpeg.h
  # (libjpeg API — jconfig.h is already generated here by cmake)
  cp ../../libjpeg-turbo/src/jpeglib.h jpeglib.h
  cp ../../libjpeg-turbo/src/jerror.h jerror.h
  cp ../../libjpeg-turbo/src/jmorecfg.h jmorecfg.h

  cd ${BASE_PATH}
}

make_fat_binary() {
  DIRECTORY=$1
  shift
  OUTPUT=$1
  shift
  SLICES=("$@")

  # Define the destination for the fat binary and make it
  OUTPUT_PATH=${DIRECTORY}"/"${OUTPUT}
  mkdir -p ${OUTPUT_PATH}

  # Build fat binaries for both static and dynamic libraries
  for LIBRARY in libjpeg.a libturbojpeg.a libjpeg.dylib libturbojpeg.dylib; do
    # Check if the library exists in the first slice
    FIRST_SLICE=${SLICES[0]}
    if [ ! -f "${DIRECTORY}/${FIRST_SLICE}/${LIBRARY}" ]; then
      continue
    fi

    LIBRARY_PATHS=""
    for S in ${SLICES[@]}; do
      LIBRARY_PATHS+=${DIRECTORY}"/"${S}"/"${LIBRARY}" "
    done

    lipo -create ${LIBRARY_PATHS} -output ${OUTPUT_PATH}"/"${LIBRARY}
  done
}

make_xcframework() {
  BUILD_DIR=$1
  shift
  SLICES_DIR=$1
  shift
  LIB_NAME=$1
  shift
  MODULE_NAME=$1
  shift
  HEADER_SOURCE_DIR=$1
  shift
  SLICES=("$@")

  # Copy the headers we need to expose (from a build slice that has them)
  HEADERS_DIR=${SLICES_DIR}"/include-${MODULE_NAME}"
  rm -rf ${HEADERS_DIR}
  mkdir -p ${HEADERS_DIR}

  if [ "${MODULE_NAME}" = "turbojpeg" ]; then
    cp ${HEADER_SOURCE_DIR}/turbojpeg.h ${HEADERS_DIR}/turbojpeg.h
  elif [ "${MODULE_NAME}" = "libjpeg" ]; then
    cp ${HEADER_SOURCE_DIR}/jpeglib.h ${HEADERS_DIR}/jpeglib.h
    cp ${HEADER_SOURCE_DIR}/jerror.h ${HEADERS_DIR}/jerror.h
    cp ${HEADER_SOURCE_DIR}/jmorecfg.h ${HEADERS_DIR}/jmorecfg.h
    cp ${HEADER_SOURCE_DIR}/jconfig.h ${HEADERS_DIR}/jconfig.h
  fi

  # Save a modulemap to the headers folder
  if [ "${MODULE_NAME}" = "turbojpeg" ]; then
cat <<EOT > ${HEADERS_DIR}/module.modulemap
module ${MODULE_NAME} [system] {
  header "turbojpeg.h"
  export *
}
EOT
  elif [ "${MODULE_NAME}" = "libjpeg" ]; then
cat <<EOT > ${HEADERS_DIR}/module.modulemap
module ${MODULE_NAME} [system] {
  header "jpeglib.h"
  header "jerror.h"
  header "jmorecfg.h"
  header "jconfig.h"
  export *
}
EOT
  fi

  # Build static xcframework
  STATIC_ARGS=""
  for S in ${SLICES[@]}; do
    if [ -f "${SLICES_DIR}/${S}/${LIB_NAME}.a" ]; then
      STATIC_ARGS+="-library ${SLICES_DIR}/${S}/${LIB_NAME}.a -headers ${HEADERS_DIR} "
    fi
  done

  if [ ! -z "${STATIC_ARGS}" ]; then
    rm -rf ${BUILD_DIR}/${LIB_NAME}-static.xcframework
    xcodebuild -create-xcframework ${STATIC_ARGS} -output ${BUILD_DIR}/${LIB_NAME}-static.xcframework
  fi

  # Build dynamic xcframework
  DYNAMIC_ARGS=""
  for S in ${SLICES[@]}; do
    if [ -f "${SLICES_DIR}/${S}/${LIB_NAME}.dylib" ]; then
      DYNAMIC_ARGS+="-library ${SLICES_DIR}/${S}/${LIB_NAME}.dylib -headers ${HEADERS_DIR} "
    fi
  done

  if [ ! -z "${DYNAMIC_ARGS}" ]; then
    rm -rf ${BUILD_DIR}/${LIB_NAME}-dynamic.xcframework
    xcodebuild -create-xcframework ${DYNAMIC_ARGS} -output ${BUILD_DIR}/${LIB_NAME}-dynamic.xcframework
  fi
}

build_ios() {
  echo "=== Building iOS ==="

  SLICES=("ios-device-arm64" "ios-simulator-x86" "ios-simulator-arm64" "ios-mac-catalyst-x86" "ios-mac-catalyst-arm64")

  # Build for each slice
  for S in ${SLICES[@]}; do
    build "build-ios/${S}"
  done

  # Combine each group of libraries into fat binaries
  SLICES=("ios-device-arm64")
  make_fat_binary "build-ios" "ios-output/ios-device" "${SLICES[@]}"

  SLICES=("ios-simulator-x86" "ios-simulator-arm64")
  make_fat_binary "build-ios" "ios-output/ios-simulator" "${SLICES[@]}"

  SLICES=("ios-mac-catalyst-x86" "ios-mac-catalyst-arm64")
  make_fat_binary "build-ios" "ios-output/ios-mac-catalyst" "${SLICES[@]}"

  # Combine the fat binaries into XCFramework bundles
  SLICES=("ios-mac-catalyst" "ios-simulator" "ios-device")
  make_xcframework "build-ios" "build-ios/ios-output" "libturbojpeg" "turbojpeg" "build-ios/ios-device-arm64" "${SLICES[@]}"
  make_xcframework "build-ios" "build-ios/ios-output" "libjpeg" "libjpeg" "build-ios/ios-device-arm64" "${SLICES[@]}"

  echo "=== iOS build complete ==="
}

build_macos() {
  echo "=== Building macOS ==="

  SLICES=("macos-arm64" "macos-x86")

  # Build for each slice
  for S in ${SLICES[@]}; do
    build "build-macos/${S}"
  done

  # Combine into fat binaries
  SLICES=("macos-arm64" "macos-x86")
  make_fat_binary "build-macos" "macos-output/macos" "${SLICES[@]}"

  # Create XCFramework bundles
  SLICES=("macos")
  make_xcframework "build-macos" "build-macos/macos-output" "libturbojpeg" "turbojpeg" "build-macos/macos-arm64" "${SLICES[@]}"
  make_xcframework "build-macos" "build-macos/macos-output" "libjpeg" "libjpeg" "build-macos/macos-arm64" "${SLICES[@]}"

  echo "=== macOS build complete ==="
}

build_tvos() {
  echo "=== Building tvOS ==="

  SLICES=("tvos-device-arm64" "tvos-simulator-arm64" "tvos-simulator-x86")

  # Build for each slice
  for S in ${SLICES[@]}; do
    build "build-tvos/${S}"
  done

  # Combine simulator slices into fat binaries
  SLICES=("tvos-device-arm64")
  make_fat_binary "build-tvos" "tvos-output/tvos-device" "${SLICES[@]}"

  SLICES=("tvos-simulator-arm64" "tvos-simulator-x86")
  make_fat_binary "build-tvos" "tvos-output/tvos-simulator" "${SLICES[@]}"

  # Create XCFramework bundles
  SLICES=("tvos-device" "tvos-simulator")
  make_xcframework "build-tvos" "build-tvos/tvos-output" "libturbojpeg" "turbojpeg" "build-tvos/tvos-device-arm64" "${SLICES[@]}"
  make_xcframework "build-tvos" "build-tvos/tvos-output" "libjpeg" "libjpeg" "build-tvos/tvos-device-arm64" "${SLICES[@]}"

  echo "=== tvOS build complete ==="
}

build_visionos() {
  echo "=== Building visionOS ==="

  SLICES=("visionos-device-arm64" "visionos-simulator-arm64")

  # Build for each slice
  for S in ${SLICES[@]}; do
    build "build-visionos/${S}"
  done

  # Each slice is single-arch, no lipo needed — just copy
  for S in ${SLICES[@]}; do
    OUTPUT_PATH="build-visionos/visionos-output/${S}"
    mkdir -p ${OUTPUT_PATH}
    for LIBRARY in libjpeg.a libturbojpeg.a libjpeg.dylib libturbojpeg.dylib; do
      if [ -f "build-visionos/${S}/${LIBRARY}" ]; then
        cp "build-visionos/${S}/${LIBRARY}" "${OUTPUT_PATH}/${LIBRARY}"
      fi
    done
  done

  # Create XCFramework bundles
  SLICES=("visionos-device-arm64" "visionos-simulator-arm64")
  make_xcframework "build-visionos" "build-visionos/visionos-output" "libturbojpeg" "turbojpeg" "build-visionos/visionos-device-arm64" "${SLICES[@]}"
  make_xcframework "build-visionos" "build-visionos/visionos-output" "libjpeg" "libjpeg" "build-visionos/visionos-device-arm64" "${SLICES[@]}"

  echo "=== visionOS build complete ==="
}

package() {
  echo "=== Packaging ==="

  mkdir -p ${OUTPUT_DIR}

  # Find and zip all xcframeworks
  for PLATFORM_DIR in build-ios build-macos build-tvos build-visionos; do
    for XCF in ${PLATFORM_DIR}/*.xcframework; do
      if [ -d "${XCF}" ]; then
        NAME=$(basename ${XCF})
        echo "Zipping ${NAME}..."
        cd ${PLATFORM_DIR}
        zip -r -y ${OUTPUT_DIR}/${NAME}.zip ${NAME}
        cd ${BASE_PATH}
      fi
    done
  done

  # Compute checksums
  echo ""
  echo "=== Checksums ==="
  for ZIP in ${OUTPUT_DIR}/*.zip; do
    if [ -f "${ZIP}" ]; then
      NAME=$(basename ${ZIP})
      CHECKSUM=$(swift package compute-checksum ${ZIP})
      echo "${NAME}: ${CHECKSUM}"
    fi
  done

  echo ""
  echo "=== Packaging complete ==="
  echo "Output directory: ${OUTPUT_DIR}"
}

# Commands
COMMAND="$1"
case "$COMMAND" in

    "all")
        download_library
        build_ios
        build_macos
        build_tvos
        build_visionos
        package
        exit 0
        ;;

    "ios")
        download_library
        build_ios
        exit 0
        ;;

    "macos")
        download_library
        build_macos
        exit 0
        ;;

    "tvos")
        download_library
        build_tvos
        exit 0
        ;;

    "visionos")
        download_library
        build_visionos
        exit 0
        ;;

    "package")
        package
        exit 0
        ;;
esac

# Print usage instructions if no arguments were set
if [ "$#" -eq 0 -o "$#" -gt 3 ]; then
    usage
    exit 1
fi
