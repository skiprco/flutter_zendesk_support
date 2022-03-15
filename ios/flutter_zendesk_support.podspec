#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint flutter_zendesk_support.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'flutter_zendesk_support'
  s.version          = '1.0.0'
  s.summary          = 'A Zendesk Support SDK Flutter plugin.'
  s.description      = <<-DESC
  A Zendesk Support SDK Flutter plugin.
                       DESC
  s.homepage         = 'http://skipr.co'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Skipr' => 'skipr@skipr.co' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.platform = :ios, '10.0'
  s.ios.deployment_target = '10.0'
  s.static_framework = true

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'

  s.dependency 'ZendeskSupportSDK', '~> 5.4.0'
end
