// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.


import PackageDescription

let package = Package(
    name: "DiiaCommonTypes",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "DiiaCommonTypes",
            targets: ["DiiaCommonTypes"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/diia-open-source/ios-mvpmodule.git", .upToNextMinor(from: Version(1, 0, 0))),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "DiiaCommonTypes",
            dependencies: [
                .product(name: "DiiaMVPModule", package: "ios-mvpmodule"),
            ]
        ),
        .testTarget(
            name: "DiiaCommonTypesTests",
            dependencies: ["DiiaCommonTypes"]),
    ]
)
