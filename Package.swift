// swift-tools-version:5.5
import PackageDescription

let package = Package(
  name: "Wrap",
  products: [
    .library(name: "Wrap", targets: ["Wrap"]),
  ],
  targets: [
    .target(name: "Wrap", dependencies: []),
  ],
  swiftLanguageVersions: [.v5]
)
