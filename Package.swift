// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SimplyCoreAudio",
    platforms: [.macOS(.v10_12)],
    
    products: [
        .library(name: "SimplyCoreAudio",
                 type: .static,
                 targets: ["SimplyCoreAudio"])
    ],
    
    dependencies: [
        // Dependencies declare other packages that this package depends on.
      .package(
            url: "https://github.com/apple/swift-atomics.git",
            .upToNextMajor(from: "1.0.0") // or `.upToNextMinor
          )
    ],
    
    targets: [
        .target(
            name: "SimplyCoreAudio",
            dependencies: [
                .target(name: "SimplyCoreAudioC"),
                .product(name: "Atomics", package: "swift-atomics")
            ]
        ),
        .target(name: "SimplyCoreAudioC",
                publicHeadersPath: "."
        ),
        .testTarget(
            name: "SimplyCoreAudioTests",
            dependencies: ["SimplyCoreAudio"]
        ),

    ],
    swiftLanguageVersions: [.v4, .v4_2, .v5]
)
