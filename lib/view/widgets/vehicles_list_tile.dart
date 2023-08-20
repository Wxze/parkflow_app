import 'package:flutter/material.dart';

class VehiclesListTile extends StatefulWidget {
  const VehiclesListTile({super.key});

  @override
  State<VehiclesListTile> createState() => _VehiclesListTileState();
}

class _VehiclesListTileState extends State<VehiclesListTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: const Column(
        children: [
          Expanded(
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Color(0xFFF0EDF5),
              child: Icon(
                Icons.directions_car_rounded,
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
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Honda Civic',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF35244E),
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.fade,
                  ),
                  Text(
                    'BRA2E17',
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF583290),
                        fontWeight: FontWeight.w600),
                    overflow: TextOverflow.fade,
                  ),
                ],
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete,
                    color: Color(0xFFC45454),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
