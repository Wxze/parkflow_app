import 'package:instant/instant.dart';
import 'package:intl/intl.dart';

class Reservation {
  final String id;
  final String checkinDate;
  final String parkingLotName;
  final int vacancyNumber;
  final String sectionName;
  final String vehicleBrand;
  final String vehicleModel;
  final String vehicleLicensePlate;

  Reservation(
      {required this.id,
      required this.checkinDate,
      required this.parkingLotName,
      required this.vacancyNumber,
      required this.sectionName,
      required this.vehicleBrand,
      required this.vehicleModel,
      required this.vehicleLicensePlate});

  factory Reservation.fromJson(Map<String, dynamic> json) {
    DateTime data = DateTime.parse(json['checkin_date']);
    DateTime formattedData = dateTimeToZone(zone: "ART", datetime: data);
    DateFormat formato = DateFormat("dd/MM/yyyy HH:mm");
    String dataFormatted = formato.format(formattedData);

    return Reservation(
        id: json['id'],
        checkinDate: dataFormatted,
        parkingLotName: json['parking_lot_name'],
        vacancyNumber: json['vacancy']['number'],
        sectionName: json['section']['name'],
        vehicleBrand: json['vehicle']['brand'],
        vehicleModel: json['vehicle']['model'],
        vehicleLicensePlate: json['vehicle']['license_plate']);
  }
}
