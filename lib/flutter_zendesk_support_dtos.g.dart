// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flutter_zendesk_support_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupportSettings _$SupportSettingsFromJson(Map<String, dynamic> json) {
  return SupportSettings(
    appId: json['appId'] as String,
    clientId: json['clientId'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$SupportSettingsToJson(SupportSettings instance) =>
    <String, dynamic>{
      'appId': instance.appId,
      'clientId': instance.clientId,
      'url': instance.url,
    };

Map<String, dynamic> _$SupportAuthenticationToJson(
        SupportAuthentication instance) =>
    <String, dynamic>{
      'token': instance.token,
      'name': instance.name,
      'email': instance.email,
    };
