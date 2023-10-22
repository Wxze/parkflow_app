import 'package:flutter/material.dart';
import 'package:parkflow_app/repository/reservations_repository.dart';
import 'package:parkflow_app/view/widgets/default_card_message.dart';
import 'package:parkflow_app/view/widgets/reservations_list_tile.dart';

import '../models/reservation.dart';

class ReservationsPage extends StatefulWidget {
  const ReservationsPage({super.key});

  @override
  State<ReservationsPage> createState() => _ReservationsPageState();
}

class _ReservationsPageState extends State<ReservationsPage> {
  late List<Reservation> reservations;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _pullRefresh,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 26),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Minhas reservas',
                    style: TextStyle(
                        color: Color(0xFF35244E),
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 2)
                ],
              ),
            ),
            FutureBuilder<List<Reservation>>(
              future: ReservationsRepository().getAll(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                } else if (!snapshot.hasData) {
                  return const DefaultCardMessage(
                      message: 'Não há reservas realizadas.');
                } else {
                  reservations = snapshot.data!;
                  if (reservations.isNotEmpty) {
                    return ListView.separated(
                      itemCount: reservations.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ReservationsListTile(
                          reservation: reservations[index],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 16,
                        );
                      },
                    );
                  } else {
                    return const DefaultCardMessage(
                        message: 'Não há reservas realizadas.');
                  }
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Future<void> _pullRefresh() async {
    setState(
      () {
        reservations = reservations;
      },
    );
  }
}
