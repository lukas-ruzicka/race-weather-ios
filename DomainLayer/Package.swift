// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DomainLayer",
    platforms: [
        .iOS(.v16), .macOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "DomainLayer",
            targets: ["DomainLayer"]),
    ],
    dependencies: [
        .package(name: "Utils", path: "../Utils")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "DomainLayer",
            dependencies: ["Utils"]),
        .testTarget(
            name: "DomainLayerTests",
            dependencies: ["DomainLayer"]),
    ]
)
