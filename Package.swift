// swift-tools-version: 5.9

import PackageDescription

let version = "3.1.3"
let baseURL = "https://github.com/TimOliver/libjpeg-turbo-cocoa/releases/download/\(version)"

let package = Package(
    name: "libjpeg-turbo",
    platforms: [
        .iOS(.v16),
        .macOS(.v13),
        .tvOS(.v16),
        .visionOS(.v1)
    ],
    products: [
        // turbojpeg — static (default)
        .library(name: "turbojpeg-ios", targets: ["turbojpeg-ios"]),
        .library(name: "turbojpeg-macos", targets: ["turbojpeg-macos"]),
        .library(name: "turbojpeg-tvos", targets: ["turbojpeg-tvos"]),
        .library(name: "turbojpeg-visionos", targets: ["turbojpeg-visionos"]),

        // turbojpeg — dynamic
        .library(name: "turbojpeg-ios-dynamic", targets: ["turbojpeg-ios-dynamic"]),
        .library(name: "turbojpeg-macos-dynamic", targets: ["turbojpeg-macos-dynamic"]),
        .library(name: "turbojpeg-tvos-dynamic", targets: ["turbojpeg-tvos-dynamic"]),
        .library(name: "turbojpeg-visionos-dynamic", targets: ["turbojpeg-visionos-dynamic"]),

        // libjpeg — static (default)
        .library(name: "libjpeg-ios", targets: ["libjpeg-ios"]),
        .library(name: "libjpeg-macos", targets: ["libjpeg-macos"]),
        .library(name: "libjpeg-tvos", targets: ["libjpeg-tvos"]),
        .library(name: "libjpeg-visionos", targets: ["libjpeg-visionos"]),

        // libjpeg — dynamic
        .library(name: "libjpeg-ios-dynamic", targets: ["libjpeg-ios-dynamic"]),
        .library(name: "libjpeg-macos-dynamic", targets: ["libjpeg-macos-dynamic"]),
        .library(name: "libjpeg-tvos-dynamic", targets: ["libjpeg-tvos-dynamic"]),
        .library(name: "libjpeg-visionos-dynamic", targets: ["libjpeg-visionos-dynamic"]),
    ],
    targets: [
        // MARK: - turbojpeg static
        .binaryTarget(
            name: "turbojpeg-ios",
            url: "\(baseURL)/libturbojpeg-ios-static.xcframework.zip",
            checksum: "TODO"
        ),
        .binaryTarget(
            name: "turbojpeg-macos",
            url: "\(baseURL)/libturbojpeg-macos-static.xcframework.zip",
            checksum: "TODO"
        ),
        .binaryTarget(
            name: "turbojpeg-tvos",
            url: "\(baseURL)/libturbojpeg-tvos-static.xcframework.zip",
            checksum: "TODO"
        ),
        .binaryTarget(
            name: "turbojpeg-visionos",
            url: "\(baseURL)/libturbojpeg-visionos-static.xcframework.zip",
            checksum: "TODO"
        ),

        // MARK: - turbojpeg dynamic
        .binaryTarget(
            name: "turbojpeg-ios-dynamic",
            url: "\(baseURL)/libturbojpeg-ios-dynamic.xcframework.zip",
            checksum: "TODO"
        ),
        .binaryTarget(
            name: "turbojpeg-macos-dynamic",
            url: "\(baseURL)/libturbojpeg-macos-dynamic.xcframework.zip",
            checksum: "TODO"
        ),
        .binaryTarget(
            name: "turbojpeg-tvos-dynamic",
            url: "\(baseURL)/libturbojpeg-tvos-dynamic.xcframework.zip",
            checksum: "TODO"
        ),
        .binaryTarget(
            name: "turbojpeg-visionos-dynamic",
            url: "\(baseURL)/libturbojpeg-visionos-dynamic.xcframework.zip",
            checksum: "TODO"
        ),

        // MARK: - libjpeg static
        .binaryTarget(
            name: "libjpeg-ios",
            url: "\(baseURL)/libjpeg-ios-static.xcframework.zip",
            checksum: "TODO"
        ),
        .binaryTarget(
            name: "libjpeg-macos",
            url: "\(baseURL)/libjpeg-macos-static.xcframework.zip",
            checksum: "TODO"
        ),
        .binaryTarget(
            name: "libjpeg-tvos",
            url: "\(baseURL)/libjpeg-tvos-static.xcframework.zip",
            checksum: "TODO"
        ),
        .binaryTarget(
            name: "libjpeg-visionos",
            url: "\(baseURL)/libjpeg-visionos-static.xcframework.zip",
            checksum: "TODO"
        ),

        // MARK: - libjpeg dynamic
        .binaryTarget(
            name: "libjpeg-ios-dynamic",
            url: "\(baseURL)/libjpeg-ios-dynamic.xcframework.zip",
            checksum: "TODO"
        ),
        .binaryTarget(
            name: "libjpeg-macos-dynamic",
            url: "\(baseURL)/libjpeg-macos-dynamic.xcframework.zip",
            checksum: "TODO"
        ),
        .binaryTarget(
            name: "libjpeg-tvos-dynamic",
            url: "\(baseURL)/libjpeg-tvos-dynamic.xcframework.zip",
            checksum: "TODO"
        ),
        .binaryTarget(
            name: "libjpeg-visionos-dynamic",
            url: "\(baseURL)/libjpeg-visionos-dynamic.xcframework.zip",
            checksum: "TODO"
        ),
    ]
)
