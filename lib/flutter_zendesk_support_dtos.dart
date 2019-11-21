import 'package:flutter/widgets.dart';

class SupportSettings {
  String appId, clientId, url;

  SupportSettings({
    @required this.appId,
    @required this.clientId,
    @required this.url
  });

  Map<String, dynamic> toJson()
    => <String, dynamic>{
      'appId': this.appId,
      'clientId': this.clientId,
      'url': this.url,
    };
}

class SupportAuthentication {
  final String token, name, email;

  SupportAuthentication._({this.name, this.email, this.token});

  factory SupportAuthentication.anonymous({String name, String email})
    => SupportAuthentication._(name:name, email:email);
  factory SupportAuthentication.jwt(String token)
    => SupportAuthentication._(token:token);

  Map<String, dynamic> toJson()
    => <String, dynamic>{
      'token': this.token,
      'name': this.name,
      'email': this.email,
    };
}

class RequestTicket {
  final String id, title;
  final List<String> tags;

  RequestTicket(this.id, {this.title, this.tags});

  Map<String, dynamic> toJson()
    => <String, dynamic>{
      'id': this.id,
      'title': this.title,
      'tags': this.tags,
    };
}

enum HelpCenterOverviewGroupType {
  none,
  section,
  category
}