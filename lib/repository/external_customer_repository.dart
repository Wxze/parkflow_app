import 'dart:convert';
import 'package:http/http.dart';
import '../models/external_customer.dart';
import 'api.dart';

class ExternalCustomersRepository {
  Future<ExternalCustomer> getExternalCustomer() async {
    Map<String, String>? auth = await ApiRepository.getTokenData();

    var resp = await get(
      Uri.parse(ApiRepository.EXTERNAL_CUSTOMERS),
      headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8',
        'access-token': auth!['access-token'] ?? '',
        'token-type': auth['token-type'] ?? '',
        'uid': auth['uid'] ?? '',
        'expiry': auth['expiry'] ?? '',
        'client': auth['client'] ?? '',
      },
    );

    ExternalCustomer externalCustomer;

    if (resp.statusCode == 200) {
      final data = await json.decode(resp.body.toString());

      externalCustomer = ExternalCustomer.fromJson(data['external_customer']);
    } else {
      throw Exception("Não foi possivel se conectar com o servidor");
    }

    return externalCustomer;
  }

  Future<Response> updateExternalCustomer({required String email, required String driverId, required String driverName, required String driverPhone}) async {
    Map<String, String>? auth = await ApiRepository.getTokenData();

    Map body = {
      "external_customer": {
        "email": email,
        "driver_attributes": {"id": driverId, "name": driverName, "phone": driverPhone}
      }
    };

    var resp = await put(
      Uri.parse(ApiRepository.EXTERNAL_CUSTOMERS),
      headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8',
        'access-token': auth!['access-token'] ?? '',
        'token-type': auth['token-type'] ?? '',
        'uid': auth['uid'] ?? '',
        'expiry': auth['expiry'] ?? '',
        'client': auth['client'] ?? '',
      },
      body: json.encode(body),
    );

    return resp;
  }
}
