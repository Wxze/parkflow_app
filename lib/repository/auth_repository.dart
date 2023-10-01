import 'dart:convert';
import 'package:http/http.dart';
import 'api.dart';

class AuthRepository {
  Future<Response> login(String email, String password) async {
    Map body = {'email': email, 'password': password};

    var resp = await post(
      Uri.parse(ApiRepository.SIGNIN),
      headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8',
      },
      body: json.encode(body),
    );

    return resp;
  }

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

  Future<Response> register(String email, String password, String cpf,
      String name, String phone) async {
    Map body = {
      'email': email,
      'password': password,
      'cpf': cpf,
      'driver_attributes': {'name': name, 'phone': phone}
    };

    var resp = await post(
      Uri.parse(ApiRepository.REGISTER),
      headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8',
      },
      body: json.encode(body),
    );

    return resp;
  }
}
