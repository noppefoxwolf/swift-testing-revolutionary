// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-testing-revolutionary",
    platforms: [
        .macOS(.v14),
    ],
    products: [
        .executable(
            name: "swift-testing-revolutionary",
            targets: ["swift-testing-revolutionary"]
        ),
        .plugin(
            name: "RevolutionaryPlugin",
            targets: ["RevolutionaryPlugin"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/apple/swift-syntax.git",
            .upToNextMajor(from: "510.0.1")
        ),
    ],
    targets: [
        .target(
            name: "RevolutionKit",
            dependencies: [
                .product(name: "SwiftSyntax", package: "swift-syntax"),
            ]
        ),
        .plugin(
            name: "RevolutionaryPlugin",
            capability: .command(
                intent: .custom(
                    verb: "revolt",
                    description: "Convert XCTest cases to swift-testing"
                ),
                permissions: [.writeToPackageDirectory(reason: "Rewrite implementations")]
            )
        ),
        .executableTarget(
            name: "swift-testing-revolutionary",
            dependencies: [
                .target(name: "RevolutionKit"),
            ]
        ),
        .testTarget(
            name: "RevolutionKitTests",
            dependencies: [
                .target(name: "RevolutionKit"),
            ]
        ),
    ]
)
