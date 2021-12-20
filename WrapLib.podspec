Pod::Spec.new do |spec|
  spec.name = "WrapLib"
  spec.version = "3.0.0"
  spec.summary = "A tiny library that enables us to describe operations in method-chain."
  spec.description = <<-DESC
  A tiny library that enables us to describe operations in method-chain.
  - a custom operator starts to chain
                   DESC
  spec.homepage = "https://github.com/VergeGroup/Wrap"
  spec.license = "MIT"
  spec.author = { "Muukii" => "muukii.app@gmail.com" }
  spec.social_media_url = "https://twitter.com/muukii_app"

  spec.ios.deployment_target = "9.0"
  spec.osx.deployment_target = "10.14"
  spec.watchos.deployment_target = "2.0"
  spec.tvos.deployment_target = "9.0"

  spec.source = { :git => "https://github.com/VergeGroup/Wrap.git", :tag => "#{spec.version}" }

  spec.source_files = "Sources/Wrap/*.swift"
  spec.swift_versions = ["5.3", "5.2", "5.1", "5.0", "4.0"]
end
