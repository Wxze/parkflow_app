import 'package:flutter/material.dart';

import '../../models/payment.dart';

class PaymentsListTile extends StatefulWidget {
  const PaymentsListTile({super.key, required this.payment});
  final Payment payment;

  @override
  State<PaymentsListTile> createState() => _PaymentsListTileState();
}

class _PaymentsListTileState extends State<PaymentsListTile> {
  late Color statusColor;

  @override
  Widget build(BuildContext context) {
    statusColor = setStatusColor(widget.payment.status);

    return ListTile(
      tileColor: Colors.white,
      leading: const Column(
        children: [
          Expanded(
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Color(0xFFF0EDF5),
              child: Icon(
                Icons.attach_money,
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
                  widget.payment.parkingLotName,
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  overflow: TextOverflow.fade,
                ),
              ),
              Flexible(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 12),
                  decoration: BoxDecoration(
                    color: statusColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    widget.payment.status,
                    style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Criado em: ${widget.payment.createdAt}',
                      style: const TextStyle(fontSize: 14, color: Color(0xFF89858E)),
                    ),
                    Text(
                      '${widget.payment.vehicleBrand} ${widget.payment.vehicleModel} - ${widget.payment.vehicleLicensePlate}',
                      style: const TextStyle(fontSize: 14, color: Color(0xFF89858E)),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 3,
                child: Text(
                  'R\$ ${widget.payment.price.replaceAll('.', ',')}',
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color setStatusColor(String status) {
    if (status == 'Pendente') {
      return const Color(0xFFF0BB3C);
    } else if (status == 'Atrasado') {
      return const Color(0xFFC45454);
    } else {
      return const Color(0xFF44A33C);
    }
  }
}
