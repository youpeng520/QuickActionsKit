// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "QuickActionsKit",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "QuickActionsKit", targets: ["QuickActionsKit"]),
    ],
    targets: [
        .target(name: "QuickActionsKit"),
    ]
)
