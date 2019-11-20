import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'flutter_zendesk_support_dtos.g.dart';

@JsonSerializable(nullable: false)
class ZendeskSupportSettings{

  String appId, clientId, url;

  ZendeskSupportSettings({
    @required this.appId,
    @required this.clientId,
    @required this.url
  });

  factory ZendeskSupportSettings.fromJson(Map<String, dynamic> json) => _$ZendeskSupportSettingsFromJson(json);
  Map<String, dynamic> toJson() => _$ZendeskSupportSettingsToJson(this);
}