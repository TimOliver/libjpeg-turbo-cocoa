# libjpeg-turbo for Apple Platforms

Pre-built [libjpeg-turbo](https://github.com/libjpeg-turbo/libjpeg-turbo) xcframeworks for Apple platforms, distributed via Swift Package Manager.

## Supported Platforms

| Platform | Architectures | Minimum Version |
|----------|--------------|-----------------|
| iOS | arm64 | 16.0 |
| iOS Simulator | arm64, x86_64 | 16.0 |
| Mac Catalyst | arm64, x86_64 | 16.0 |
| macOS | arm64, x86_64 | 13.0 |
| tvOS | arm64 | 16.0 |
| tvOS Simulator | arm64, x86_64 | 16.0 |
| visionOS | arm64 | 1.0 |
| visionOS Simulator | arm64 | 1.0 |

## Libraries

This package provides two libraries from libjpeg-turbo:

- **turbojpeg** — The TurboJPEG API (recommended, simpler and higher-level)
- **libjpeg** — The traditional libjpeg API

Both are available as static and dynamic variants, per platform.

## Swift Package Manager

Add this package to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/TimOliver/libjpeg-turbo-cocoa.git", from: "3.1.3")
]
```

Then add the platform-specific product to your target. Since each platform has its own binary, use platform conditions for multi-platform targets:

```swift
.target(
    name: "YourTarget",
    dependencies: [
        .product(name: "turbojpeg-ios", package: "libjpeg-turbo-cocoa",
                 condition: .when(platforms: [.iOS])),
        .product(name: "turbojpeg-macos", package: "libjpeg-turbo-cocoa",
                 condition: .when(platforms: [.macOS])),
        .product(name: "turbojpeg-tvos", package: "libjpeg-turbo-cocoa",
                 condition: .when(platforms: [.tvOS])),
        .product(name: "turbojpeg-visionos", package: "libjpeg-turbo-cocoa",
                 condition: .when(platforms: [.visionOS])),
    ]
)
```

Or add it via Xcode: File > Add Package Dependencies, and enter the repository URL.

### Available Products

| Library | iOS | macOS | tvOS | visionOS |
|---------|-----|-------|------|----------|
| turbojpeg (static) | `turbojpeg-ios` | `turbojpeg-macos` | `turbojpeg-tvos` | `turbojpeg-visionos` |
| turbojpeg (dynamic) | `turbojpeg-ios-dynamic` | `turbojpeg-macos-dynamic` | `turbojpeg-tvos-dynamic` | `turbojpeg-visionos-dynamic` |
| libjpeg (static) | `libjpeg-ios` | `libjpeg-macos` | `libjpeg-tvos` | `libjpeg-visionos` |
| libjpeg (dynamic) | `libjpeg-ios-dynamic` | `libjpeg-macos-dynamic` | `libjpeg-tvos-dynamic` | `libjpeg-visionos-dynamic` |

## Building from Source

### Prerequisites

- Xcode (with command-line tools)
- CMake

### Build Commands

```sh
# Build all platforms
sh build.sh all

# Build a single platform
sh build.sh ios
sh build.sh macos
sh build.sh tvos
sh build.sh visionos

# Package xcframeworks into zips with checksums
sh build.sh package
```

### Custom Version

Override the libjpeg-turbo version with an environment variable:

```sh
LIBJPEGTURBO_TAG_VERSION=3.1.0 sh build.sh all
```

Default version: **3.1.3**

## Output

After running `sh build.sh all`, you'll find:

- `build-<platform>/static/` — Static xcframeworks
- `build-<platform>/dynamic/` — Dynamic xcframeworks
- `output/` — Zipped xcframeworks with checksums for distribution

Zip filenames follow the pattern `lib<name>-<platform>-<linkage>.xcframework.zip`.

## CI / Releases

Releases are built via a GitHub Actions workflow (`build.yml`), triggered manually with a version number input. The workflow builds all platforms and uploads the 16 xcframework zips as release assets.

## License

This build system is released into the public domain (Unlicense). libjpeg-turbo itself is distributed under multiple licenses — see the [libjpeg-turbo license](https://github.com/libjpeg-turbo/libjpeg-turbo/blob/main/LICENSE.md) for details.
