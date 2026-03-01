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
            checksum: "4d82b282404f3ff4aa57e857073b6173c1632a851591ca5f9e8aa7d03de78282"
        ),
        .binaryTarget(
            name: "turbojpeg-macos",
            url: "\(baseURL)/libturbojpeg-macos-static.xcframework.zip",
            checksum: "80c554cb04fdf3b2e7403ffd19230eb5cb59851beccaffb90c8805e70687ad17"
        ),
        .binaryTarget(
            name: "turbojpeg-tvos",
            url: "\(baseURL)/libturbojpeg-tvos-static.xcframework.zip",
            checksum: "c03bbcc245e7cac06fbc6a3c3483d44ec00dd7fbd35cefab4338c6fa2eb05a5e"
        ),
        .binaryTarget(
            name: "turbojpeg-visionos",
            url: "\(baseURL)/libturbojpeg-visionos-static.xcframework.zip",
            checksum: "c27090733a342e69503ca05f45acc743dfb7b596954502f1c39930c0f98b03d0"
        ),

        // MARK: - turbojpeg dynamic
        .binaryTarget(
            name: "turbojpeg-ios-dynamic",
            url: "\(baseURL)/libturbojpeg-ios-dynamic.xcframework.zip",
            checksum: "2594341910b68e784d8d42115fc7a72aaf06c42e71069129fcf4412aa5c8be93"
        ),
        .binaryTarget(
            name: "turbojpeg-macos-dynamic",
            url: "\(baseURL)/libturbojpeg-macos-dynamic.xcframework.zip",
            checksum: "dddfe6a964f2a0da8331f7d7ed1672d7127c976e5a96cd1bbfe21de302c47e2b"
        ),
        .binaryTarget(
            name: "turbojpeg-tvos-dynamic",
            url: "\(baseURL)/libturbojpeg-tvos-dynamic.xcframework.zip",
            checksum: "1f2b7178429dd30e652172bfc003fe4045c14af72390a1e7a5a8c8e0fb3a3380"
        ),
        .binaryTarget(
            name: "turbojpeg-visionos-dynamic",
            url: "\(baseURL)/libturbojpeg-visionos-dynamic.xcframework.zip",
            checksum: "a26ebc8056cf7da288dfba64e9f0569506b66e4b090c876b7407b34b66c61385"
        ),

        // MARK: - libjpeg static
        .binaryTarget(
            name: "libjpeg-ios",
            url: "\(baseURL)/libjpeg-ios-static.xcframework.zip",
            checksum: "dabe36d8fd28ddfe385c9fb708c30659fbd5eb4aae2d7505d167809995485ea8"
        ),
        .binaryTarget(
            name: "libjpeg-macos",
            url: "\(baseURL)/libjpeg-macos-static.xcframework.zip",
            checksum: "b87eab3bb1f487a431d7ef4686ed8f0fd37dc21bd74db4c4d37435c2548427f0"
        ),
        .binaryTarget(
            name: "libjpeg-tvos",
            url: "\(baseURL)/libjpeg-tvos-static.xcframework.zip",
            checksum: "ac1be85019f7ea44b6cc8b20a5979cb282fe5e2435b60640d809fa10077eef57"
        ),
        .binaryTarget(
            name: "libjpeg-visionos",
            url: "\(baseURL)/libjpeg-visionos-static.xcframework.zip",
            checksum: "6bcd0ab471960a16746e808dca371a7104a302d990d6880a9add47c0e4a4786c"
        ),

        // MARK: - libjpeg dynamic
        .binaryTarget(
            name: "libjpeg-ios-dynamic",
            url: "\(baseURL)/libjpeg-ios-dynamic.xcframework.zip",
            checksum: "258fce48ef3434941ba9739f2f320a851cd4e8dd330af75946a43ce160573000"
        ),
        .binaryTarget(
            name: "libjpeg-macos-dynamic",
            url: "\(baseURL)/libjpeg-macos-dynamic.xcframework.zip",
            checksum: "03751bb15e969cb1576ff6d630aaddb3b715ae8cdf03e64deee334fb893a7d6b"
        ),
        .binaryTarget(
            name: "libjpeg-tvos-dynamic",
            url: "\(baseURL)/libjpeg-tvos-dynamic.xcframework.zip",
            checksum: "ca5bd155f5b28c7eb6d17d2d0349b65760740f330c62f8c30fdde2c0f30998d6"
        ),
        .binaryTarget(
            name: "libjpeg-visionos-dynamic",
            url: "\(baseURL)/libjpeg-visionos-dynamic.xcframework.zip",
            checksum: "c49f353d967ec1ce6667d26e42b2cb0e42661c60dd864b1771e203a1a2ca712c"
        ),
    ]
)
