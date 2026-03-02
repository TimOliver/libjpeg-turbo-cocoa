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
            checksum: "d7413a32c14e006037e9d085a67e8b24c46d8f3fd6e81329562cc1c96976cbb5"
        ),
        .binaryTarget(
            name: "turbojpeg-dynamic",
            url: "\(baseURL)/libjpeg-turbo-v\(version)-xcframework-turbojpeg-dynamic.zip",
            checksum: "672adda76ede48ebba1dba853fb1157115ba41d093ecdcac438a4c3e9d88ee87"
        ),
        .binaryTarget(
            name: "libjpeg",
            url: "\(baseURL)/libjpeg-turbo-v\(version)-xcframework-jpeglib-static.zip",
            checksum: "263df56d6388e7252cc187a90b9e5852a77b02ecbb70e7fd0bc0811d88ef73a6"
        ),
        .binaryTarget(
            name: "libjpeg-dynamic",
            url: "\(baseURL)/libjpeg-turbo-v\(version)-xcframework-jpeglib-dynamic.zip",
            checksum: "f3155465831e092f59c520aa9e6718e3086f0ea63bb5a55aec8da8f1b88b1e2e"
        ),
    ]
)
