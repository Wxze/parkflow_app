import 'package:flutter/material.dart';

class ReservationsListTile extends StatefulWidget {
  const ReservationsListTile({super.key});

  @override
  State<ReservationsListTile> createState() => _ReservationsListTileState();
}

class _ReservationsListTileState extends State<ReservationsListTile> {
  @override
  Widget build(BuildContext context) {
    return const ListTile(
      tileColor: Colors.white,
      leading: Column(
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
                  'Reserva em LeroPark - Rede Brasileira de Estacionamentos',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  overflow: TextOverflow.fade,
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  'Chegar em 20/10/2023, 10:09h',
                  style: TextStyle(fontSize: 14, color: Color(0xFF89858E)),
                ),
                Text(
                  'Honda Civic - BRA2E19',
                  style: TextStyle(fontSize: 14, color: Color(0xFF89858E)),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 5,
            child: Text(
              'Vaga 5A',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
