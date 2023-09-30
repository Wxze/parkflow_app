import 'dart:convert';

import 'package:http/http.dart';

import 'api.dart';

class LoginRepository {
  Future<Response> login(String email, String password) async {
    Map body = {'email': email, 'password': password};

    var resp = await post(
      Uri.parse(ApiRepository.SIGNIN),
      headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8',
      },
      body: json.encode(body),
    );

    if (resp.statusCode == 200 || resp.statusCode == 201) {
      final data = await json.decode(resp.body.toString());
    }

    return resp;
  }
}
