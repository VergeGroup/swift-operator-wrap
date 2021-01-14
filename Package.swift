// swift-tools-version:5.3
import PackageDescription

let package = Package(
  name: "Chain",  
  products: [
    .library(name: "Chain", targets: ["Chain"]),
  ],
  targets: [
    .target(name: "Chain", dependencies: []),
  ],
  swiftLanguageVersions: [.v5]
)