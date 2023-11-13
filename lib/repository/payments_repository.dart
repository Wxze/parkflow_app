import 'dart:convert';
import 'package:http/http.dart';
import '../models/payment.dart';
import 'api.dart';

class PaymentsRepository {
  Future<List<Payment>> getAll() async {
    Map<String, String>? auth = await ApiRepository.getTokenData();

    var resp = await get(
      Uri.parse(ApiRepository.PAYMENTS),
      headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8',
        'access-token': auth!['access-token'] ?? '',
        'token-type': auth['token-type'] ?? '',
        'uid': auth['uid'] ?? '',
        'expiry': auth['expiry'] ?? '',
        'client': auth['client'] ?? '',
      },
    );

    List<Payment> payments = [];
    if (resp.statusCode == 200) {
      final data = await json.decode(resp.body.toString());

      for (var item in data['customer_payments']) {
        payments.add(Payment.fromJson(item));
      }
    } else {
      throw Exception("Não foi possivel se conectar com o servidor");
    }

    return payments;
  }
}
