import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

abstract class AppPosition {
  static late Position _appPosition;

  static Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Os serviços de localização estão desativados');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('As permissões de localização foram negadas');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'As permissões de localização estão negadas permanentemente');
    }

    return await Geolocator.getCurrentPosition();
  }

  static void setPosition(BuildContext context) async {
    AppPosition._appPosition = await AppPosition.determinePosition().catchError(
      (error) {
        showSnackBar(error, context);
        return error;
      },
    );
  }

  static Position getPosition() {
    return AppPosition._appPosition;
  }

  static void showSnackBar(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 4),
      content: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const Icon(
          Icons.error,
          color: Colors.white,
        ),
        const SizedBox(width: 10),
        Flexible(child: Text(message))
      ]),
      backgroundColor: Colors.red,
    ));
  }
}
