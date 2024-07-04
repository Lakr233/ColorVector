// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "ColorVector",
    platforms: [
        .iOS(.v14),
        .macOS(.v11),
        .macCatalyst(.v14),
        .tvOS(.v14),
        .visionOS(.v1),
    ],
    products: [
        .library(name: "ColorVector", targets: ["ColorVector"]),
    ],
    targets: [
        .target(name: "ColorVector"),
        .testTarget(name: "ColorVectorTests", dependencies: ["ColorVector"]),
    ]
)
