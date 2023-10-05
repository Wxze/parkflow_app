// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class ApiRepository {
  static const STORAGE = FlutterSecureStorage();

  static const BASE = 'http://10.0.2.2:3000/';

  static const SIGNIN = '${BASE}auth/external_customers/sign_in';

  static const REGISTER = '${BASE}auth/external_customers';

  static const PASSWORD = '${BASE}auth/external_customers/password';

  static Future<Map<String, String>?> getTokenData() async {
    var data = await STORAGE.read(key: 'auth');

    if (data == null) {
      return null;
    }

    var jsonDecoded = json.decode(data);

    Map<String, String> authObj = {
      'access-token': jsonDecoded['access-token'],
      'token-type': jsonDecoded['token-type'],
      'uid': jsonDecoded['uid'],
      'expiry': jsonDecoded['expiry'],
      'client': jsonDecoded['client'],
    };

    return authObj;
  }
}
