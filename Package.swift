// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "ColorVector",
    products: [
        .library(name: "ColorVector", targets: ["ColorVector"]),
    ],
    targets: [
        .target(name: "ColorVector"),
        .testTarget(name: "ColorVectorTests", dependencies: ["ColorVector"]),
    ]
)
