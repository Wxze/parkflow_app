import 'dart:convert';
import 'package:http/http.dart';
import '../models/reservation.dart';
import 'api.dart';

class ReservationsRepository {
  Future<List<Reservation>> getAll() async {
    Map<String, String>? auth = await ApiRepository.getTokenData();

    var resp = await get(
      Uri.parse(ApiRepository.RESERVATIONS),
      headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8',
        'access-token': auth!['access-token'] ?? '',
        'token-type': auth['token-type'] ?? '',
        'uid': auth['uid'] ?? '',
        'expiry': auth['expiry'] ?? '',
        'client': auth['client'] ?? '',
      },
    );

    List<Reservation> reservations = [];
    if (resp.statusCode == 200) {
      final data = await json.decode(resp.body.toString());

      for (var item in data['reservation']) {
        reservations.add(Reservation.fromJson(item));
      }
    } else {
      throw Exception("Não foi possivel se conectar com o servidor");
    }

    return reservations;
  }
}
