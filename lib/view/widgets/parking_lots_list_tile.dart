import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:parkflow_app/models/parking_lot.dart';
import 'package:parkflow_app/view/reservation_view.dart';

class ParkingLotsListTile extends StatefulWidget {
  const ParkingLotsListTile({required this.parkingLot, super.key});
  final ParkingLot parkingLot;

  @override
  State<ParkingLotsListTile> createState() => _ParkingLotsListTileState();
}

class _ParkingLotsListTileState extends State<ParkingLotsListTile> {
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
                Icons.warehouse,
                color: Color(0xFF4A326D),
              ),
            ),
          ),
        ],
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 7,
                child: Text(
                  widget.parkingLot.name,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600),
                  overflow: TextOverflow.fade,
                ),
              ),
              Flexible(
                flex: 3,
                child: Text(
                  'R\$ ${widget.parkingLot.valuePerHour}',
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 7,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 7,
                child: Text(
                  '${widget.parkingLot.street}, ${widget.parkingLot.number}\n${widget.parkingLot.city} - ${widget.parkingLot.state}, ${widget.parkingLot.zipCode}',
                  style:
                      const TextStyle(fontSize: 14, color: Color(0xFF89858E)),
                ),
              ),
              Flexible(
                flex: 3,
                child: Text(
                  '${widget.parkingLot.distance.toStringAsFixed(2)} km',
                  style:
                      const TextStyle(fontSize: 14, color: Color(0xFF89858E)),
                ),
              ),
            ],
          ),
        ],
      ),
      onTap: () => Navigator.of(context).push(
        PageTransition(
          child: const ReservationView(),
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 300),
        ),
      ),
    );
  }
}
