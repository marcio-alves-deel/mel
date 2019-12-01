import 'package:flutter/services.dart';

class ServerException implements Exception {}

class NetworkException implements Exception {}

class CacheException implements Exception {}

class AuthenticationException implements PlatformException {
  @override
  String get code => code;

  @override
  get details => details;

  @override
  String get message => message;
}
