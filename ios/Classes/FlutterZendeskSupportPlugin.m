#import "FlutterZendeskSupportPlugin.h"
#if __has_include(<flutter_zendesk_support/flutter_zendesk_support-Swift.h>)
#import <flutter_zendesk_support/flutter_zendesk_support-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "flutter_zendesk_support-Swift.h"
#endif

@implementation FlutterZendeskSupportPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterZendeskSupportPlugin registerWithRegistrar:registrar];
}
@end
