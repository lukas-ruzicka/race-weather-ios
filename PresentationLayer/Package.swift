// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "PresentationLayer",
    platforms: [
        .iOS(.v16), .macOS(.v13)
    ],
    products: [
        .library(
            name: "PresentationLayer",
            targets: ["PresentationLayer"]),
    ],
    dependencies: [
        .package(name: "Utils", path: "../Utils"),
        .package(name: "DomainLayer", path: "../DomainLayer")
    ],
    targets: [
        .target(
            name: "PresentationLayer",
            dependencies: ["Utils", "DomainLayer"])
    ]
)
