// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UIKitHelp",
    platforms: [.macOS(.v10_13),
                                      .iOS(.v12),
                                      .tvOS(.v12),
                                      .watchOS(.v4)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "UIKitHelp",
            targets: ["UIKitHelp"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "UIKitHelp",path: "UIKitHelp/Classes"),
        .testTarget(
            name: "UIKitHelpTests",
            dependencies: ["UIKitHelp"]
        ),
    ]
)
