import 'package:flutter/material.dart';
import 'package:parkflow_app/view/widgets/payments_list_tile.dart';

class PaymentsPage extends StatefulWidget {
  const PaymentsPage({super.key});

  @override
  State<PaymentsPage> createState() => _PaymentsPageState();
}

class _PaymentsPageState extends State<PaymentsPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 26),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Meus pagamentos',
                  style: TextStyle(
                      color: Color(0xFF35244E),
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 2)
              ],
            ),
          ),
          ListView.separated(
            itemCount: 20,
            itemBuilder: (context, index) {
              return const PaymentsListTile();
            },
            clipBehavior: Clip.none,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 16,
              );
            },
          )
        ],
      ),
    );
  }
}
