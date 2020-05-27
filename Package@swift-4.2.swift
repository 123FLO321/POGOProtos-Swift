// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "POGOProtos",
    products: [
        .library(name: "POGOProtos", targets: ["POGOProtos"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-protobuf.git", from: "1.9.0")
    ],
    targets: [
        .target(name: "POGOProtos", dependencies: ["SwiftProtobuf"])
    ],
    swiftLanguageVersions: [.v4, .v4_2]
)
