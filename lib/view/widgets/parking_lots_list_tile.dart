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
      leading: Column(
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
                  'LeroPark - Rede Brasileira de Estacionamentos',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  overflow: TextOverflow.fade,
                ),
              ),
              Flexible(
                flex: 3,
                child: Text(
                  'R\$ 10,00',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 7,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 7,
                child: Text(
                  'Rua Barão do Rio Branco, 364, Serrana - SP, 14150-000',
                  style: TextStyle(fontSize: 14, color: Color(0xFF89858E)),
                ),
              ),
              Flexible(
                flex: 3,
                child: Text(
                  '500 m',
                  style: TextStyle(fontSize: 14, color: Color(0xFF89858E)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
