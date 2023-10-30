import 'package:flutter/material.dart';
import '../../models/vehicle.dart';

class VehicleCard extends StatefulWidget {
  const VehicleCard(
      {super.key,
      required this.vehicle,
      required this.isSelected,
      required this.onCardTapped});
  final Vehicle vehicle;
  final bool isSelected;
  final Function onCardTapped;

  @override
  State<VehicleCard> createState() => _VehicleCardState();
}

class _VehicleCardState extends State<VehicleCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onCardTapped();
      },
      child: Card(
        elevation: 3,
        child: Container(
          decoration: BoxDecoration(
            color: widget.isSelected ? const Color(0x40583290) : Colors.white,
            border: const Border(
              top: BorderSide(color: Color(0xFF69479B), width: 5),
            ),
          ),
          width: 165,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.vehicle.vehicleType == 'car'
                    ? Icons.directions_car_rounded
                    : Icons.two_wheeler_rounded,
                color: const Color(0xFF4A326D),
              ),
              const SizedBox(width: 5),
              Text(
                widget.vehicle.brand,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.vehicle.model,
                overflow: TextOverflow.ellipsis,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                widget.vehicle.licensePlate,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF583290)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
