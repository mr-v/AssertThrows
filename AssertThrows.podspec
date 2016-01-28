Pod::Spec.new do |s|
  s.name         = "AssertThrows"
  s.version      = "0.1"
  s.summary      = "Custom assertions for asserting throwing functions in Swift 2.x."
  s.description  = <<-DESC
Fixes XCTest's missing support for testing error handling in Swift 2.x. Custom assertions enable following throwing function assertions:
1. Throws error.
2. Throws specific ErrorType implementer.
3. Throws specific case of ErrorType implementer.*
  DESC
  s.homepage     = "https://github.com/mr-v/AssertThrows"
  s.license      = { :type => "MIT", :file => "License" }
  s.author             = "Witold Skibniewski"
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/mr-v/AssertThrows.git", :tag => "#{s.version}" }
  s.source_files  = "AssertThrows/AssertThrows.swift"
  s.framework  = "XCTest"
  s.pod_target_xcconfig = { 'ENABLE_BITCODE' => 'NO' }
end