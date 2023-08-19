import 'package:flutter/material.dart';

class PaymentsListTile extends StatefulWidget {
  const PaymentsListTile({super.key});

  @override
  State<PaymentsListTile> createState() => _PaymentsListTileState();
}

class _PaymentsListTileState extends State<PaymentsListTile> {
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
              const Flexible(
                flex: 7,
                child: Text(
                  'LeroPark - Rede Brasileira de Estacionamentos',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  overflow: TextOverflow.fade,
                ),
              ),
              Flexible(
                flex: 3,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF44A33C),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    'Pago',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 7,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Checkout - 10:09 de 20/10/2023',
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
                flex: 3,
                child: Text(
                  'R\$ 10,00',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
