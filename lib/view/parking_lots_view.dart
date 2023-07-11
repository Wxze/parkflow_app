import 'package:flutter/material.dart';

class ParkingLotsView extends StatefulWidget {
  const ParkingLotsView({super.key});

  @override
  State<ParkingLotsView> createState() => _ParkingLotsViewState();
}

class _ParkingLotsViewState extends State<ParkingLotsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text(
          'ParkFlow',
          style: TextStyle(
              fontFamily: 'Galada', color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
