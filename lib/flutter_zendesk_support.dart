import 'dart:async';

import 'package:flutter/services.dart';

import 'flutter_zendesk_support_dtos.dart';

export 'flutter_zendesk_support_dtos.dart';

class FlutterZendeskSupport {
  static const MethodChannel _channel =
      const MethodChannel('flutter_zendesk_support');

  static Future<bool> init(SupportSettings settings) async {
    return await _channel.invokeMethod('init', settings.toJson());
  }

  static Future<bool> authenticate(SupportAuthentication auth) async {
    return await _channel.invokeMethod('authenticate', auth.toJson());
  }

  static Future<bool> openHelpCenter([List<int> articles]) async {
    return await _channel.invokeMethod('openHelpCenter');
  }

  static Future<bool> openTicket() async {
    return await _channel.invokeMethod('openTicket');
  }

  static Future<bool> openTickets() async {
    return await _channel.invokeMethod('openTickets');
  }
}