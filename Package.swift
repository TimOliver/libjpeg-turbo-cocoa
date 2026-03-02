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
            checksum: "106bf48dca15ffe1af5b821f132c721bafecc432469e9fe58121a87aa3ea4110"
        ),
        .binaryTarget(
            name: "turbojpeg-dynamic",
            url: "\(baseURL)/libjpeg-turbo-v\(version)-xcframework-turbojpeg-dynamic.zip",
            checksum: "54b85b4a49b292a3101d128c955a1ad8868c8befb600d2e85dd0dbb7a82ef44c"
        ),
        .binaryTarget(
            name: "libjpeg",
            url: "\(baseURL)/libjpeg-turbo-v\(version)-xcframework-jpeglib-static.zip",
            checksum: "2ad108eb274513071c589628c0624e4c26266f1932d2f052cca062a8c0ab0ae3"
        ),
        .binaryTarget(
            name: "libjpeg-dynamic",
            url: "\(baseURL)/libjpeg-turbo-v\(version)-xcframework-jpeglib-dynamic.zip",
            checksum: "467f4530fbebf628c7c1c99216aefa405a4a6ea00a6a91af523d1dc1c872a630"
        ),
    ]
)
