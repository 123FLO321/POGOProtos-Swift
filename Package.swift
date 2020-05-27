// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "POGOProtos-Swift",
    products: [
        .library(name: "POGOProtos", targets: ["POGOProtos"])
    ],
    dependencies: [
        .package(name: "SwiftProtobuf", url: "https://github.com/apple/swift-protobuf.git", from: "1.9.0")
    ],
    targets: [
        .target(name: "POGOProtos", dependencies: ["SwiftProtobuf"])
    ]
)
