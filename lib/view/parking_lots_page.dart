import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:parkflow_app/models/parking_lot.dart';
import 'package:parkflow_app/repository/parking_lots_repository.dart';
import 'package:parkflow_app/view/widgets/parking_lots_list_tile.dart';

class ParkingLotsPage extends StatefulWidget {
  const ParkingLotsPage({super.key});

  @override
  State<ParkingLotsPage> createState() => _ParkingLotsPageState();
}

class _ParkingLotsPageState extends State<ParkingLotsPage> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _pullRefresh,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 26),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Estacionamentos',
                        style: TextStyle(
                            color: Color(0xFF35244E),
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'perto de você',
                        style: TextStyle(
                            color: Color(0xBF4A326D),
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: const Color(0xFF583290),
                    child: IconButton(
                      onPressed: () {},
                      splashRadius: 25,
                      icon: const Icon(
                        Icons.tune,
                        size: 20,
                      ),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            FutureBuilder<List<ParkingLot>>(
              future: ParkingLotsRepository().searchByPosition(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                } else if (!snapshot.hasData) {
                  return const Text('Sem dados disponíveis.');
                } else {
                  List<ParkingLot> parkingLots = snapshot.data!;
                  return ListView.separated(
                    itemCount: parkingLots.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ParkingLotsListTile(
                        parkingLot: parkingLots[index],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 16,
                      );
                    },
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Future<void> _pullRefresh() async {
    print('refreshed');
  }
}
