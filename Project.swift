import ProjectDescription

let project = Project(
    name: "Lodestar",
    organizationName: "sitnikovdev",
    targets: [
        .target(
            name: "Lodestar",
            destinations: .iOS,
            product: .app,
            bundleId: "dev.sitnikov.Lodestar",
            deploymentTargets: .iOS("18.0"),
            infoPlist: .extendingDefault(with: [
                "UILaunchScreen": .dictionary([:])
            ]),
            sources: ["Sources/Lodestar/**"],
            dependencies: [],
            settings: .settings(
            base: [
                "CODE_SIGNING_ALLOWED": "NO",
                "CODE_SIGNING_REQUIRED": "NO",
                "ENABLE_PREVIEWS": "NO"
            ]
            )
        ),
        .target(
            name: "LodestarTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "dev.sitnikov.LodestarTests",
            deploymentTargets: .iOS("18.0"),
            infoPlist: .default,
            sources: ["Tests/LodestarTests/**"],
            dependencies: [
                .target(name: "Lodestar")
            ],
            settings: .settings(
            base: [
                "CODE_SIGNING_ALLOWED": "NO",
                "CODE_SIGNING_REQUIRED": "NO",
                "ENABLE_PREVIEWS": "NO"
            ]
            )
        )
    ]
)
