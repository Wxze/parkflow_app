import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'package:parkflow_app/utils/app_position.dart';
import '../models/parking_lot.dart';
import 'api.dart';

class ParkingLotsRepository {
  Future<List<ParkingLot>> searchByPosition() async {
    Position appPosition = await AppPosition.determinePosition();

    Map body = {'lat': appPosition.latitude, 'long': appPosition.longitude};
    Map<String, String>? auth = await ApiRepository.getTokenData();

    var resp = await post(
      Uri.parse(ApiRepository.PARKING_LOTS_POSITION),
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

    // print(auth['access-token']);
    // print(auth['token-type']);
    // print(auth['uid']);
    // print(auth['expiry']);
    // print(auth['client']);

    // print('access-token: ${resp.headers["access-token"]}');

    List<ParkingLot> parkingLots = [];
    if (resp.statusCode == 200) {
      final data = await json.decode(resp.body.toString());

      for (var item in data['parking_lots']) {
        parkingLots.add(ParkingLot.fromJson(item));
      }
    } else {
      throw Exception("Não foi possivel se conectar com o servidor");
    }

    return parkingLots;
  }
}
