# libjpeg-turbo-cocoa

Native-compiled [libjpeg-turbo](https://github.com/libjpeg-turbo/libjpeg-turbo) as static and dynamic XCFrameworks for Apple platforms, distributed via Swift Package Manager.

Exposes two libraries:
- **turbojpeg** — the TurboJPEG API (`turbojpeg.h`)
- **jpeglib** — the libjpeg-compatible API (`jpeglib.h`, `jerror.h`, `jmorecfg.h`, `jconfig.h`)

## Build

Requires cmake (`brew install cmake`) and Xcode. On this machine Xcode is at `/Applications/Xcode-beta.app` — ensure it's the active developer directory:

```sh
sudo xcode-select -s /Applications/Xcode-beta.app/Contents/Developer
export PATH="/opt/homebrew/bin:$PATH"
sh build.sh all
```

### Build commands

| Command | Description |
|---------|-------------|
| `all` | Full build: all platforms + combined xcframeworks + zip |
| `ios` / `macos` / `tvos` / `visionos` | Build a single platform |
| `package` | Zip xcframeworks and compute SPM checksums |

## Project structure

- `build-{platform}/{slice}/toolchain.cmake` — cmake toolchain files, committed to the repo
- `build-combined/` — combined all-platform xcframeworks
- `output/` — final zip artifacts (git-ignored)

## Naming conventions

- Framework bundles: `turbojpeg.framework` (binary: `turbojpeg`) and `jpeglib.framework` (binary: `jpeglib`)
- Static and dynamic frameworks are staged in `{slice}/static/` and `{slice}/dynamic/` subdirectories so both can share the same framework name without colliding
- Per-platform xcframeworks: `turbojpeg.xcframework` / `jpeglib.xcframework` inside `build-{platform}/static/` or `build-{platform}/dynamic/`
- Combined xcframeworks: `turbojpeg-static.xcframework`, `turbojpeg-dynamic.xcframework`, `jpeglib-static.xcframework`, `jpeglib-dynamic.xcframework` in `build-combined/`
- **Zip artifacts**: `libjpeg-turbo-v{version}-xcframework-{module}-{static|dynamic}.zip` (combined), `libjpeg-turbo-v{version}-xcframework-{platform}-{module}-{static|dynamic}.zip` (per-platform)

## SPM products

| Product | Type | Library |
|---------|------|---------|
| `turbojpeg` | static | TurboJPEG API |
| `turbojpeg-dynamic` | dynamic | TurboJPEG API |
| `libjpeg` | static | libjpeg-compatible API |
| `libjpeg-dynamic` | dynamic | libjpeg-compatible API |

## CI

GitHub Actions workflow at `.github/workflows/build.yml`, triggered manually with a `version` input. Runs on `macos-26`, installs cmake via brew, downloads tvOS/visionOS SDKs, builds, updates `Package.swift` checksums, commits, and creates a GitHub release.

The checksum step in the workflow loops explicitly over `turbojpeg`/`jpeglib` × `static`/`dynamic` and matches on the stable suffix `xcframework-{module}-{variant}.zip` in `Package.swift` (since the URL contains Swift string interpolation `\(version)` which won't match a literal filename).
