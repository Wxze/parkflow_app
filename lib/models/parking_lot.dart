import 'package:intl/intl.dart';

class ParkingLot {
  final String id;
  final String name;
  final String email;
  final String valuePerHour;
  final String phone;
  final String zipCode;
  final String city;
  final String street;
  final String neighborhood;
  final String state;
  final String number;
  final double distance;

  ParkingLot(
      this.id,
      this.name,
      this.email,
      this.valuePerHour,
      this.phone,
      this.zipCode,
      this.city,
      this.street,
      this.neighborhood,
      this.state,
      this.number,
      this.distance);

  factory ParkingLot.fromJson(Map<String, dynamic> json) {
    double valuePerHourtoDouble =
        double.parse(json['billing_detail']['value_per_hour']);

    NumberFormat formatoComVirgula = NumberFormat.decimalPattern('pt_BR');
    String valuePerHourFormatado =
        formatoComVirgula.format(valuePerHourtoDouble);

    return ParkingLot(
      json['id'],
      json['name'],
      json['email'],
      valuePerHourFormatado,
      json['phone'],
      json['zip_code'],
      json['city'],
      json['street'],
      json['neighborhood'],
      json['state'],
      json['number'],
      json['distance']['value'],
    );
  }
}
