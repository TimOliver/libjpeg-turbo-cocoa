// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "libjpeg-turbo",
    platforms: [
        .iOS(.v16),
        .macOS(.v13),
        .tvOS(.v16),
        .visionOS(.v1)
    ],
    products: [
        .library(name: "turbojpeg", targets: ["turbojpeg"]),
        .library(name: "turbojpeg-dynamic", targets: ["turbojpeg-dynamic"]),
        .library(name: "libjpeg", targets: ["libjpeg"]),
        .library(name: "libjpeg-dynamic", targets: ["libjpeg-dynamic"]),
    ],
    targets: [
        // Static libraries
        .binaryTarget(
            name: "turbojpeg",
            // For releases, replace path with:
            // url: "https://github.com/<owner>/libjpeg-turbo-cocoa/releases/download/<version>/libturbojpeg-static.xcframework.zip",
            // checksum: "<checksum>"
            path: "build-ios/libturbojpeg-static.xcframework"
        ),
        .binaryTarget(
            name: "libjpeg",
            // For releases, replace path with:
            // url: "https://github.com/<owner>/libjpeg-turbo-cocoa/releases/download/<version>/libjpeg-static.xcframework.zip",
            // checksum: "<checksum>"
            path: "build-ios/libjpeg-static.xcframework"
        ),

        // Dynamic libraries
        .binaryTarget(
            name: "turbojpeg-dynamic",
            // For releases, replace path with:
            // url: "https://github.com/<owner>/libjpeg-turbo-cocoa/releases/download/<version>/libturbojpeg-dynamic.xcframework.zip",
            // checksum: "<checksum>"
            path: "build-ios/libturbojpeg-dynamic.xcframework"
        ),
        .binaryTarget(
            name: "libjpeg-dynamic",
            // For releases, replace path with:
            // url: "https://github.com/<owner>/libjpeg-turbo-cocoa/releases/download/<version>/libjpeg-dynamic.xcframework.zip",
            // checksum: "<checksum>"
            path: "build-ios/libjpeg-dynamic.xcframework"
        ),
    ]
)
