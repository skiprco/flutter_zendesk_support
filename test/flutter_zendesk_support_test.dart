import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_zendesk_support/flutter_zendesk_support.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_zendesk_support');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await FlutterZendeskSupport.platformVersion, '42');
  });
}
