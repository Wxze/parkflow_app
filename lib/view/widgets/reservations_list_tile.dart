import 'package:flutter/material.dart';

import '../../models/reservation.dart';

class ReservationsListTile extends StatefulWidget {
  const ReservationsListTile({super.key, required this.reservation});
  final Reservation reservation;

  @override
  State<ReservationsListTile> createState() => _ReservationsListTileState();
}

class _ReservationsListTileState extends State<ReservationsListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      leading: const Column(
        children: [
          Expanded(
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Color(0xFFF0EDF5),
              child: Icon(
                Icons.badge,
                color: Color(0xFF4A326D),
              ),
            ),
          ),
        ],
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Reserva em ${widget.reservation.parkingLotName}',
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  overflow: TextOverflow.fade,
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  'Chegar em: ${widget.reservation.checkinDate}',
                  style: const TextStyle(fontSize: 14, color: Color(0xFF89858E)),
                ),
                Text(
                  'Data de saída: ${widget.reservation.checkoutDate ?? "N/A"}',
                  style: const TextStyle(fontSize: 14, color: Color(0xFF89858E)),
                ),
                Text(
                  '${widget.reservation.vehicleBrand} ${widget.reservation.vehicleModel} - ${widget.reservation.vehicleLicensePlate}',
                  style: const TextStyle(fontSize: 14, color: Color(0xFF89858E)),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 5,
            child: Column(
              children: [
                Text(
                  'Vaga - ${widget.reservation.vacancyNumber}',
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                Text(
                  'Seção - ${widget.reservation.sectionName}',
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
