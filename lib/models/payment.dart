import 'package:instant/instant.dart';
import 'package:intl/intl.dart';

class Payment {
  final String id;
  final String status;
  final String price;
  final String createdAt;
  final String? paymentDate;
  final String parkingLotName;
  final String vehicleBrand;
  final String vehicleModel;
  final String vehicleLicensePlate;

  Payment(
      {required this.id,
      required this.status,
      required this.price,
      required this.createdAt,
      required this.paymentDate,
      required this.parkingLotName,
      required this.vehicleBrand,
      required this.vehicleModel,
      required this.vehicleLicensePlate});

  factory Payment.fromJson(Map<String, dynamic> json) {
    DateTime creationDateUTC = DateTime.parse(json['created_at']);
    DateTime parsedCreationDate = dateTimeToZone(zone: "ART", datetime: creationDateUTC);
    DateFormat formato = DateFormat("dd/MM/yyyy HH:mm");
    String creationDateFormatted = formato.format(parsedCreationDate);
    String? paymentDateFormatted;

    if (json['payment_date'] != null) {
      DateTime paymentDateUTC = DateTime.parse(json['payment_date']);
      DateTime parsedPaymentDate = dateTimeToZone(zone: "ART", datetime: paymentDateUTC);
      paymentDateFormatted = formato.format(parsedPaymentDate);
    }

    return Payment(
      id: json['id'],
      status: json['status_to_human'],
      price: json['price'],
      createdAt: creationDateFormatted,
      paymentDate: paymentDateFormatted,
      parkingLotName: json['parking_lot']['name'],
      vehicleBrand: json['vehicle']['brand'],
      vehicleModel: json['vehicle']['model'],
      vehicleLicensePlate: json['vehicle']['license_plate']
    );
  }
}
