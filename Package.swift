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
            checksum: "e9c96a75a308d35e95af7a610c986104e2009aa28a000785d7c98e606f423590"
        ),
        .binaryTarget(
            name: "turbojpeg-macos",
            url: "\(baseURL)/libturbojpeg-macos-static.xcframework.zip",
            checksum: "ef5f7a257bd787789ffb3fa50a9e9587f0a48781750c857014468d609dc0bc0d"
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
            checksum: "e422c59e59ecf8e8cb62240b993290df046adb139993c7b261caeca69be520ed"
        ),
        .binaryTarget(
            name: "turbojpeg-macos-dynamic",
            url: "\(baseURL)/libturbojpeg-macos-dynamic.xcframework.zip",
            checksum: "c1fb812b3696419a77d90b6e434498de8ff90de10a867db8cc4599cb0dd909fd"
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
            checksum: "23eb4b73da7ff6fbb2dabe051cc370311a003a72d79d36f7bab59803354a1ed1"
        ),
        .binaryTarget(
            name: "libjpeg-macos",
            url: "\(baseURL)/libjpeg-macos-static.xcframework.zip",
            checksum: "7b84c321eba1029e456326192e3f0b919ff56fd92102e2f9a1e919514c77b687"
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
            checksum: "605ee3f267fa15c8a71b0ba693885372310291639fdf31da92d142de2abe5c31"
        ),
        .binaryTarget(
            name: "libjpeg-macos-dynamic",
            url: "\(baseURL)/libjpeg-macos-dynamic.xcframework.zip",
            checksum: "0cecb61ff5b56a4bdd8c3afebb4d502ef7d3559f16b27a150fcc31fd908c743b"
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
