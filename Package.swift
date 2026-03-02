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
            url: "\(baseURL)/libjpeg-turbo-v\(version)-xcframework-turbojpeg-static.zip",
            checksum: "f1eef005e7236b9b2c93a9abc104933f302ceac49b272467cd8083c91ca428d6"
        ),
        .binaryTarget(
            name: "turbojpeg-dynamic",
            url: "\(baseURL)/libjpeg-turbo-v\(version)-xcframework-turbojpeg-dynamic.zip",
            checksum: "a969e1abaaccbb9985831bd48468ee92eb533b95fd3a2637d05d35b93b0857a3"
        ),
        .binaryTarget(
            name: "libjpeg",
            url: "\(baseURL)/libjpeg-turbo-v\(version)-xcframework-jpeglib-static.zip",
            checksum: "44eb9ba8851375c147e4f37e5b311fae186f0506fa581c89dfcaf927e8debaa7"
        ),
        .binaryTarget(
            name: "libjpeg-dynamic",
            url: "\(baseURL)/libjpeg-turbo-v\(version)-xcframework-jpeglib-dynamic.zip",
            checksum: "79a0c547f3e5b46016b01a066f9311734936f65b2d7de283d0d3deb3a64c45aa"
        ),
    ]
)
