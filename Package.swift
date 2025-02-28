// swift-tools-version:6.0
import PackageDescription

let package = Package(
  name: "Wrap",
  products: [
    .library(name: "Wrap", targets: ["Wrap"]),
  ],
  targets: [
    .target(name: "Wrap", dependencies: []),
    .testTarget(name: "WrapTests", dependencies: ["Wrap"])
  ],
  swiftLanguageModes: [.v6]
)
