// ignore_for_file: constant_identifier_names

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class ApiRepository {
  static const STORAGE = FlutterSecureStorage();

  static const BASE = 'http://10.0.2.2:3000/';

  static const SIGNIN = '${BASE}auth/external_customers/sign_in';

  static const REGISTER = '${BASE}auth/external_customers';

  static const PASSWORD = '${BASE}auth/external_customers/password';
}
