// swift-tools-version:5.5
import PackageDescription

let package = Package(
  name: "Wrap",
  platforms: [
    .iOS(.v13),
    .macOS(.v10_15),
    .tvOS(.v13),
    .watchOS(.v6)
  ],
  products: [
    .library(name: "Wrap", targets: ["Wrap"]),
  ],
  targets: [
    .target(name: "Wrap", dependencies: []),
    .testTarget(name: "WrapTests", dependencies: ["Wrap"])
  ],
  swiftLanguageVersions: [.v5]
)
