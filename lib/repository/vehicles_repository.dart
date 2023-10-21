import 'dart:convert';
import 'package:http/http.dart';
import 'package:parkflow_app/models/vehicle.dart';
import 'api.dart';

class VehiclesRepository {
  Future<List<Vehicle>> getAll() async {
    Map<String, String>? auth = await ApiRepository.getTokenData();

    var resp = await get(
      Uri.parse(ApiRepository.VEHICLES),
      headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8',
        'access-token': auth!['access-token'] ?? '',
        'token-type': auth['token-type'] ?? '',
        'uid': auth['uid'] ?? '',
        'expiry': auth['expiry'] ?? '',
        'client': auth['client'] ?? '',
      },
    );

    List<Vehicle> vehicles = [];
    if (resp.statusCode == 200) {
      final data = await json.decode(resp.body.toString());

      for (var item in data['vehicles']) {
        vehicles.add(Vehicle.fromJson(item));
      }
    } else {
      throw Exception("Não foi possivel se conectar com o servidor");
    }

    return vehicles;
  }

  Future<Response> deleteVehicle(String id) async {
    Map<String, String>? auth = await ApiRepository.getTokenData();

    var resp = await delete(
      Uri.parse('${ApiRepository.VEHICLES}/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8',
        'access-token': auth!['access-token'] ?? '',
        'token-type': auth['token-type'] ?? '',
        'uid': auth['uid'] ?? '',
        'expiry': auth['expiry'] ?? '',
        'client': auth['client'] ?? '',
      },
    );

    return resp;
  }

  Future<Response> addVehicle(Vehicle vehicle) async {
    Map<String, String>? auth = await ApiRepository.getTokenData();
    int vehicleTypeToNumber = 0;

    if(vehicle.vehicleType.toUpperCase() == 'CARRO'){
      vehicleTypeToNumber = 0;
    }

    if(vehicle.vehicleType.toUpperCase() == 'MOTO'){
      vehicleTypeToNumber = 1;
    }

    Map body = {
      'license_plate': vehicle.licensePlate.toUpperCase(),  
      'brand': vehicle.brand,
      'model': vehicle.model,
      'color': vehicle.color,
      'vehicle_type': vehicleTypeToNumber,
    };

    var resp = await post(
      Uri.parse(ApiRepository.VEHICLES),
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
