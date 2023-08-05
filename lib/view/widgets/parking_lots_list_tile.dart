import 'package:flutter/material.dart';

class ParkingLotsListTile extends StatefulWidget {
  const ParkingLotsListTile({super.key});

  @override
  State<ParkingLotsListTile> createState() => _ParkingLotsListTileState();
}

class _ParkingLotsListTileState extends State<ParkingLotsListTile> {
  @override
  Widget build(BuildContext context) {
    return const ListTile(
      tileColor: Colors.white,
      leading: CircleAvatar(
        radius: 18,
        backgroundColor: Color(0xFFF0EDF5),
        child: Icon(
          Icons.warehouse,
          color: Color(0xFF4A326D),
        ),
      ),
      title: Text('LeroPark'),
    );
  }
}
