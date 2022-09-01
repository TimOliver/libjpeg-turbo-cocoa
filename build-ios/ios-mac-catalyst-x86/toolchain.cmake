execute_process(COMMAND xcrun --sdk macosx --show-sdk-path OUTPUT_VARIABLE SYSROOT)
string(STRIP ${SYSROOT} SYSROOT)

set(CMAKE_SYSTEM_PROCESSOR x86_64-apple-darwin)
set(CMAKE_C_FLAGS "-Wall -arch x86_64 -funwind-tables -miphoneos-version-min=13.1 -target x86_64-apple-ios13.1-macabi")
set(CMAKE_OSX_SYSROOT "${SYSROOT}")
