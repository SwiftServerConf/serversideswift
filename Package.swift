// swift-tools-version:5.10

import PackageDescription

let package = Package(
    name: "Conference",
    platforms: [.macOS(.v12)],
    products: [
        .executable(
            name: "Conference",
            targets: ["Conference"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/johnsundell/publish.git", from: "0.8.0")
    ],
    targets: [
        .executableTarget(
            name: "Conference",
            dependencies: [
                .product(name: "Publish", package: "publish")
            ]
        )
    ]
)