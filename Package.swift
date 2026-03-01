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
<<<<<<< Updated upstream
            name: "turbojpeg-ios",
            url: "\(baseURL)/libturbojpeg-ios-static.xcframework.zip",
            checksum: "0b10d844cc83a081d6c407aab41e9dfd5ef9f3c877cbfb4060e02012a44d9ecb"
        ),
        .binaryTarget(
            name: "turbojpeg-macos",
            url: "\(baseURL)/libturbojpeg-macos-static.xcframework.zip",
            checksum: "8de0e41e8bbab6b1204c39b51650e111a34882803b7684c4f3ff5b42e18d9664"
        ),
        .binaryTarget(
            name: "turbojpeg-tvos",
            url: "\(baseURL)/libturbojpeg-tvos-static.xcframework.zip",
            checksum: "e197cf6e258f6dc8bac0625a76e9ccbd793a3895fb32800850e2fd621d2e3829"
        ),
        .binaryTarget(
            name: "turbojpeg-visionos",
            url: "\(baseURL)/libturbojpeg-visionos-static.xcframework.zip",
            checksum: "071864e43896b7c8bfb6fca4182f217916cf70b78dee1150fa648f6bdf633c94"
        ),

        // MARK: - turbojpeg dynamic
        .binaryTarget(
            name: "turbojpeg-ios-dynamic",
            url: "\(baseURL)/libturbojpeg-ios-dynamic.xcframework.zip",
            checksum: "0e5a6457e452c3d5ddc9077cb7594b310862ff364da3825884a4e66a1254025f"
        ),
        .binaryTarget(
            name: "turbojpeg-macos-dynamic",
            url: "\(baseURL)/libturbojpeg-macos-dynamic.xcframework.zip",
            checksum: "1b6d66abb29d415dddbcafbfb52dc28cac46f6405ea001ef5f4122320b56170e"
        ),
        .binaryTarget(
            name: "turbojpeg-tvos-dynamic",
            url: "\(baseURL)/libturbojpeg-tvos-dynamic.xcframework.zip",
            checksum: "425202b0f35b0c9e9eb0b4865cee8f1eead667bad5b6eecceb003dc90c654972"
        ),
        .binaryTarget(
            name: "turbojpeg-visionos-dynamic",
            url: "\(baseURL)/libturbojpeg-visionos-dynamic.xcframework.zip",
            checksum: "e08638b1ce4df6155e6a81d2bbfa2d14c8c9911cd632d9843d390470234429a5"
        ),

        // MARK: - libjpeg static
        .binaryTarget(
            name: "libjpeg-ios",
            url: "\(baseURL)/libjpeg-ios-static.xcframework.zip",
            checksum: "b0f4855a919de24316a3b5af21540b8e86746755660dd2f70718e1263c5280b4"
        ),
        .binaryTarget(
            name: "libjpeg-macos",
            url: "\(baseURL)/libjpeg-macos-static.xcframework.zip",
            checksum: "741f801325fabb6b0b82aa1b167dd3f91a76167077e107e0dbdbfde1d53b9f75"
        ),
        .binaryTarget(
            name: "libjpeg-tvos",
            url: "\(baseURL)/libjpeg-tvos-static.xcframework.zip",
            checksum: "f034e4a464a33ac9fa45dffefcd4394d5d0736a6c875a3cb12d1282ba294a3fb"
        ),
        .binaryTarget(
            name: "libjpeg-visionos",
            url: "\(baseURL)/libjpeg-visionos-static.xcframework.zip",
            checksum: "db07535a5806a8abfffc8d043a02668df0c9ed6f31e76a43018317cd57e86761"
        ),

        // MARK: - libjpeg dynamic
        .binaryTarget(
            name: "libjpeg-ios-dynamic",
            url: "\(baseURL)/libjpeg-ios-dynamic.xcframework.zip",
            checksum: "3bdd750ef0a64c881292fc57b0aff445719f9754b92be1e02b003d4249f2c2bd"
        ),
        .binaryTarget(
            name: "libjpeg-macos-dynamic",
            url: "\(baseURL)/libjpeg-macos-dynamic.xcframework.zip",
            checksum: "a4d94b3ad3c082fe63a3c0551c39e7998191d9c1181ada12339329f1f77f828e"
        ),
        .binaryTarget(
            name: "libjpeg-tvos-dynamic",
            url: "\(baseURL)/libjpeg-tvos-dynamic.xcframework.zip",
            checksum: "2b01705b1525f0424a45b79c0a33c5ffd320df555eef57ff54c2ca2bf125c796"
        ),
        .binaryTarget(
            name: "libjpeg-visionos-dynamic",
            url: "\(baseURL)/libjpeg-visionos-dynamic.xcframework.zip",
            checksum: "101eab92e2d7d62af0d26740ecdbf55ea8f57ba98690964f9055b12dbbbb3982"
=======
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
>>>>>>> Stashed changes
        ),
    ]
)
