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
            checksum: "8c3b4e3ae582c964ff5d77b73a21e0e3398525335116e87c75c7e01c6e1a206a"
        ),
        .binaryTarget(
            name: "turbojpeg-dynamic",
            url: "\(baseURL)/libturbojpeg-dynamic.xcframework.zip",
            checksum: "469dcbd51dbf5c4e04f5f24468cde9e637ba0070da02e7a082cdbedc1333aae2"
        ),
        .binaryTarget(
            name: "libjpeg",
            url: "\(baseURL)/libjpeg-static.xcframework.zip",
            checksum: "f7d54633b81e837e796f1f20080a4b4427c8563595f01eb4b5868cb4d987278d"
        ),
        .binaryTarget(
            name: "libjpeg-dynamic",
            url: "\(baseURL)/libjpeg-dynamic.xcframework.zip",
            checksum: "6d8d8a43df5a77ec301b0be3c12254213575fef53c7abbab1f741637abe7da15"
        ),
    ]
)
