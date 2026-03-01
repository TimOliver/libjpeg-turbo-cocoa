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
            checksum: "b05278552498335efc95ca1fb89a3a2f7ff3cc2886e4bd9c8da837b8b4ae9595"
        ),
        .binaryTarget(
            name: "turbojpeg-macos",
            url: "\(baseURL)/libturbojpeg-macos-static.xcframework.zip",
            checksum: "3c5c14ea2d837659265e8618f103afcc6bf6ad4afb726f0c633c83cb3414a45d"
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
            checksum: "c1435a1c54f5c7a0eae861c9018ba7acdc79e15ce5c679aa14eec4b8975922ab"
        ),
        .binaryTarget(
            name: "turbojpeg-macos-dynamic",
            url: "\(baseURL)/libturbojpeg-macos-dynamic.xcframework.zip",
            checksum: "5c66eef9a7a73b5a869dd71c71090f26a59c8028816f2df6f16cbdfc5a32e046"
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
            checksum: "da333a8114af02a711a85cd07a2cdfdf9ad9f88c4014581a75918d3b1db596c3"
        ),
        .binaryTarget(
            name: "libjpeg-macos",
            url: "\(baseURL)/libjpeg-macos-static.xcframework.zip",
            checksum: "8c530e747ffc1d7e4c2d3d2ddb18f54748210b3ba15a90c7dc73edab51baf12d"
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
            checksum: "714a7af4eb294b01d8ac00f04f7f2bc6aeb860d0a58561e663fc16e42c03a56e"
        ),
        .binaryTarget(
            name: "libjpeg-macos-dynamic",
            url: "\(baseURL)/libjpeg-macos-dynamic.xcframework.zip",
            checksum: "f280fde7b1c853b5969c7a47ce6d2b7d56db795299ff3af383c470ca76a7995d"
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
