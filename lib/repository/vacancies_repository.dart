import 'dart:convert';
import 'package:http/http.dart';
import '../models/vacancy.dart';
import 'api.dart';

class VacanciesRepository {
  Future<List<Vacancy>> getAll(String parkingLotId) async {
    Map<String, String>? auth = await ApiRepository.getTokenData();

    var resp = await get(
      Uri.parse('${ApiRepository.VACANCIES}?parking_lot=$parkingLotId&per_page=100'),
      headers: <String, String>{
        'Content-Type': 'application/json;charset=UTF-8',
        'access-token': auth!['access-token'] ?? '',
        'token-type': auth['token-type'] ?? '',
        'uid': auth['uid'] ?? '',
        'expiry': auth['expiry'] ?? '',
        'client': auth['client'] ?? '',
      },
    );

    List<Vacancy> vacancies = [];
    if (resp.statusCode == 200) {
      final data = await json.decode(resp.body.toString());

      for (var item in data['vacancies']) {
        vacancies.add(Vacancy.fromJson(item));
      }
    } else {
      throw Exception("Não foi possivel se conectar com o servidor");
    }

    return vacancies;
  }
}
