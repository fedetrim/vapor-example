// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "ThirdPartyDependencies",
    dependencies: [
        .package(url: "https://github.com/Moya/Moya.git", from: "11.0.0")
    ],
    targets: [
        .target(name: "ThirdPartyDependencies", dependencies: ["Moya"])
    ]
)
