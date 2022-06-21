// swift-tools-version:5.5

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
        .package(name: "Publish", url: "https://github.com/johnsundell/publish.git", from: "0.8.0")
    ],
    targets: [
        .executableTarget(
            name: "Conference",
            dependencies: ["Publish"]
        )
    ]
)