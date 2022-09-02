

# Print a list of all of the build options this script supports
usage() {
cat <<EOF
Usage: sh $0 command [argument]
command:
  all:              builds all frameworks
  ios:              builds iOS framework
  tvos:             builds tvOS framework
  macos:            builds macOS framework
EOF
}

# Global values
readonly BASE_PATH=$(pwd)
readonly LIBRARY_URL="https://github.com/libjpeg-turbo/libjpeg-turbo/archive/refs/tags/"
readonly LIBRARY_DIR="libjpeg-turbo"
readonly COMPILER=$(xcode-select -p)"/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang"

# Read the tag from ENV, or default to the last varified stable version
LIBRARY_VERSION="2.1.4"
if [[ ! -z ${LIBJPEGTURBO_TAG_VERSION} ]]; then
  LIBRARY_VERSION=${LIBJPEGTURBO_TAG_VERSION}
fi

# Verify Xcode and its build tools are available
readonly XCODE=$(xcodebuild -version | grep Xcode | cut -d " " -f2)
if [[ -z "${XCODE}" ]]; then
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

build_ios() {
  SLICES=("ios-device-arm64" "ios-simulator-x86" "ios-simulator-arm64" "ios-mac-catalyst-x86" "ios-mac-catalyst-arm64")

  # Build a static framework for each slice
  for S in ${SLICES[@]}; do
    build "build-ios/${S}"
  done

  # Combine each group of libraries into fat binaries
  SLICES=("ios-device-arm64")
  make_fat_binary "build-ios"  "ios-output/ios-device" "${SLICES[@]}"

  SLICES=("ios-simulator-x86" "ios-simulator-arm64")
  make_fat_binary "build-ios" "ios-output/ios-simulator"  "${SLICES[@]}"

  SLICES=("ios-mac-catalyst-x86" "ios-mac-catalyst-arm64")
  make_fat_binary "build-ios" "ios-output/ios-mac-catalyst" "${SLICES[@]}"

  # Combine the fat binaries into XCFramework bundles
  SLICES=("ios-mac-catalyst" "ios-simulator" "ios-device")
  make_libjpeg_turbo_xcframework "build-ios" "build-ios/ios-output" "${SLICES[@]}"
}

build() {
  CMAKE_PATH=$1

  cd ${CMAKE_PATH}

  cmake -G"Unix Makefiles" \
    -DCMAKE_TOOLCHAIN_FILE=toolchain.cmake \
    -DCMAKE_SYSTEM_NAME=Darwin \
    -DENABLE_SHARED=OFF \
    -DCMAKE_C_COMPILER=${COMPILER} \
    ../../libjpeg-turbo
  make

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

  # Build both libraries
  for LIBRARY in libjpeg.a libturbojpeg.a; do
    LIBRARY_PATHS=""
    for S in ${SLICES[@]}; do
      LIBRARY_PATHS+=${DIRECTORY}"/"${S}"/"${LIBRARY}" "
    done

     lipo -create ${LIBRARY_PATHS} -output ${OUTPUT_PATH}"/"${LIBRARY}
  done
}

make_libjpeg_turbo_xcframework() {
  BUILD_DIR=$1
  shift
  SLICES_DIR=$1
  shift
  SLICES=("$@")

  # Copy the headers we need to expose
  HEADERS_DIR=${SLICES_DIR}"/include"
  mkdir -p ${HEADERS_DIR}
  cp ${LIBRARY_DIR}"/turbojpeg.h" ${HEADERS_DIR}"/turbojpeg.h"

  # Save a modulemap to the headers folder
cat <<EOT >> ${HEADERS_DIR}/module.modulemap
module libturbojpeg [system] {
  header "turbojpeg.h"
  export *
}
EOT

  # Build the arguments list for all of the architectures
  SLICE_ARGUMENTS=""
  for S in ${SLICES[@]}; do
        SLICE_ARGUMENTS+="-library ${SLICES_DIR}/${S}/libturbojpeg.a -headers ${HEADERS_DIR}/ "
  done

  # Build the xcframework
  xcodebuild -create-xcframework ${SLICE_ARGUMENTS} -output ${BUILD_DIR}"/"libturbojpeg.xcframework
}

# Commands
COMMAND="$1"
case "$COMMAND" in

      "all")
        download_library
        build_ios
        # build_tvos
        # build_macos
        # build_watchos
        exit 0
        ;;

    "ios")
        download_library
        #build_ios
        exit 0
        ;;

    "tvos")
        download_library
        #build_tvos
        exit 0
        ;;

    "macos")
        download_library
        #build_macos
        exit 0
        ;;
esac

# Print usage instructions if no arguments were set
if [ "$#" -eq 0 -o "$#" -gt 3 ]; then
    usage
    exit 1
fi
