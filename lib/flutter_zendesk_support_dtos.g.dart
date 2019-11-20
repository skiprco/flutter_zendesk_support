// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flutter_zendesk_support_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ZendeskSupportSettings _$ZendeskSupportSettingsFromJson(
    Map<String, dynamic> json) {
  return ZendeskSupportSettings(
    appId: json['appId'] as String,
    clientId: json['clientId'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$ZendeskSupportSettingsToJson(
        ZendeskSupportSettings instance) =>
    <String, dynamic>{
      'appId': instance.appId,
      'clientId': instance.clientId,
      'url': instance.url,
    };
