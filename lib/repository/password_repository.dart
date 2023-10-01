import 'dart:convert';

import 'package:http/http.dart';

import 'api.dart';

class PasswordRepository {
  Future<Response> sendEmail(String email) async {
    Map body = {'email': email};

    var resp = await post(
      Uri.parse(ApiRepository.PASSWORD),
      headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8',
      },
      body: json.encode(body),
    );

    return resp;
  }
}
