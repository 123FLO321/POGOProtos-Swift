import PackageDescription
let package = Package(
    name: "POGOProtos",
    targets: [],
    dependencies: [
        .Package(url: "https://github.com/apple/swift-protobuf.git", majorVersion: 1)
    ]
)
