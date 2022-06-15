// ignore_for_file: empty_catches

import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Injects token at send
class TokenInjectionInterceptor implements InterceptorContract {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final storage = const FlutterSecureStorage();
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    try {
      final SharedPreferences prefs = await _prefs;

      data.params["lang"] = prefs.getString("lang").toString();
      String token = "";

      try {
        String? value = await storage.read(key: 'user');
        token = (jsonDecode(value!)['token']);
      } catch (err) {}

      data.params["token"] = token;
    } catch (e) {}
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async =>
      data;
}
