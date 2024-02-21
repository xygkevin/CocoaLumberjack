Pod::Spec.new do |s|
  s.name     = 'CocoaLumberjack'
  s.version  = '3.8.4'
  s.license  = 'BSD'
  s.summary  = 'A fast & simple, yet powerful & flexible logging framework for macOS, iOS, tvOS and watchOS.'
  s.authors  = { 'Robbie Hanson' => 'robbiehanson@deusty.com' }
  s.homepage = 'https://github.com/xygkevin/CocoaLumberjack'
  s.source   = { :git => 'https://github.com/xygkevin/CocoaLumberjack.git',
                 :tag => "#{s.version}" }

  s.description = <<-DESC
It is similar in concept to other popular logging frameworks such as log4j, yet is designed specifically for objective-c, and takes advantage of features such as multi-threading, grand central dispatch (if available), lockless atomic operations, and the dynamic nature of the objective-c runtime.
                  DESC

  s.cocoapods_version = '>= 1.7.0'
  s.swift_versions = ['5.5', '5.6', '5.7']

  
  s.ios.deployment_target     = '12.0'

  s.preserve_paths = 'README.md', 'LICENSE', 'CHANGELOG.md'
  s.pod_target_xcconfig  = { 'VALID_ARCHS' => 'x86_64 armv7 arm64' }

  s.default_subspecs = 'Core'
  s.requires_arc 	    = true
  s.subspec 'Core' do |ss|
    ss.source_files         = 'Sources/CocoaLumberjack/**/*.{h,m}'
    ss.private_header_files = 'Sources/CocoaLumberjack/DD*Internal.{h}'
    ss.resource_bundles = { 'CocoaLumberjackPrivacy' => 'Sources/CocoaLumberjack/PrivacyInfo.xcprivacy' }

  end

  s.subspec 'Swift' do |ss|
    ss.dependency 'CocoaLumberjack/Core'
    ss.source_files = 'Sources/CocoaLumberjackSwift/**/*.swift', 'Sources/CocoaLumberjackSwiftSupport/include/**/*.{h}'
  end
end
