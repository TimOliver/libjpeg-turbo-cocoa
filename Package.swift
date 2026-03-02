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
            checksum: "28d9c60f4d9cd591c1196c7b8eda7978b4d70f9f47a6106337e5be75bc9aef5b"
        ),
        .binaryTarget(
            name: "turbojpeg-dynamic",
            url: "\(baseURL)/libjpeg-turbo-v\(version)-xcframework-turbojpeg-dynamic.zip",
            checksum: "b05c0373ce40dd94242aa0c53667fd385646d04240bb65eafaed15e01300b825"
        ),
        .binaryTarget(
            name: "libjpeg",
            url: "\(baseURL)/libjpeg-turbo-v\(version)-xcframework-jpeglib-static.zip",
            checksum: "2937c5910270a43720ff51a0385c64cc5782481a6a6d5dbbc9934dca453994c6"
        ),
        .binaryTarget(
            name: "libjpeg-dynamic",
            url: "\(baseURL)/libjpeg-turbo-v\(version)-xcframework-jpeglib-dynamic.zip",
            checksum: "dbff9751aa51ab4358f9cf4e39b7ae1b3f7dd1330a8c6211748f67d6e31eb0b1"
        ),
    ]
)
