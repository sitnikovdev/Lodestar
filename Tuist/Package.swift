// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "Lodestar",
    dependencies: [
        .package(
            url: "https://github.com/pointfreeco/swift-composable-architecture",
            from: "1.26.1"
        )
    ]
)
