// swift-tools-version: 5.9

import PackageDescription

let version = "3.1.3"
let baseURL = "https://github.com/TimOliver/libjpeg-turbo-cocoa/releases/download/\(version)"

let package = Package(
    name: "libjpeg-turbo-cocoa",
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
        .binaryTarget(
            name: "turbojpeg",
            url: "\(baseURL)/libturbojpeg-static.xcframework.zip",
            checksum: "TODO"
        ),
        .binaryTarget(
            name: "turbojpeg-dynamic",
            url: "\(baseURL)/libturbojpeg-dynamic.xcframework.zip",
            checksum: "TODO"
        ),
        .binaryTarget(
            name: "libjpeg",
            url: "\(baseURL)/libjpeg-static.xcframework.zip",
            checksum: "TODO"
        ),
        .binaryTarget(
            name: "libjpeg-dynamic",
            url: "\(baseURL)/libjpeg-dynamic.xcframework.zip",
            checksum: "TODO"
        ),
    ]
)
