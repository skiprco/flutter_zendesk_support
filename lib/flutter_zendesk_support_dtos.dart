import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'flutter_zendesk_support_dtos.g.dart';

//  flutter pub run build_runner build --delete-conflicting-outputs

@JsonSerializable(nullable: false)
class SupportSettings{
  String appId, clientId, url;

  SupportSettings({
    @required this.appId,
    @required this.clientId,
    @required this.url
  });

  factory SupportSettings.fromJson(Map<String, dynamic> json) => _$SupportSettingsFromJson(json);
  Map<String, dynamic> toJson() => _$SupportSettingsToJson(this);
}

@JsonSerializable(nullable: false, createFactory: false)
class SupportAuthentication{
  final String token, name, email;

  SupportAuthentication._({this.name, this.email, this.token});

  factory SupportAuthentication.anonymous({String name, String email})
    => SupportAuthentication._(name:name, email:email);
  factory SupportAuthentication.jwt(String token)
    => SupportAuthentication._(token:token);

  factory SupportAuthentication.fromJson(Map<String, dynamic> json)
    => SupportAuthentication._(
      token: json['token'] as String,
      name: json['name'] as String,
      email: json['email'] as String);

  Map<String, dynamic> toJson() => _$SupportAuthenticationToJson(this);
}