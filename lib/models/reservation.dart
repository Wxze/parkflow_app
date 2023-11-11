import 'package:instant/instant.dart';
import 'package:intl/intl.dart';

class Reservation {
  final String id;
  final String checkinDate;
  final String? checkoutDate;
  final String parkingLotName;
  final int vacancyNumber;
  final String sectionName;
  final String vehicleBrand;
  final String vehicleModel;
  final String vehicleLicensePlate;

  Reservation(
      {required this.id,
      required this.checkinDate,
      required this.checkoutDate,
      required this.parkingLotName,
      required this.vacancyNumber,
      required this.sectionName,
      required this.vehicleBrand,
      required this.vehicleModel,
      required this.vehicleLicensePlate});

  factory Reservation.fromJson(Map<String, dynamic> json) {
    DateTime checkinDateUTC = DateTime.parse(json['checkin_date']);
    DateTime parsedCheckin = dateTimeToZone(zone: "ART", datetime: checkinDateUTC);
    DateFormat formato = DateFormat("dd/MM/yyyy HH:mm");
    String checkinFormatted = formato.format(parsedCheckin);
    String? checkoutFormatted;

    if (json['checkout_date'] != null) {
      DateTime checkoutDateUTC = DateTime.parse(json['checkout_date']);
      DateTime parsedCheckout = dateTimeToZone(zone: "ART", datetime: checkoutDateUTC);
      checkoutFormatted = formato.format(parsedCheckout);
    }

    return Reservation(
        id: json['id'],
        checkinDate: checkinFormatted,
        checkoutDate: checkoutFormatted,
        parkingLotName: json['parking_lot']['name'],
        vacancyNumber: json['vacancy']['number'],
        sectionName: json['section']['name'],
        vehicleBrand: json['vehicle']['brand'],
        vehicleModel: json['vehicle']['model'],
        vehicleLicensePlate: json['vehicle']['license_plate']);
  }
}
