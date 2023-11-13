import 'package:flutter/material.dart';
import 'package:parkflow_app/view/widgets/default_card_message.dart';
import 'package:parkflow_app/view/widgets/payments_list_tile.dart';

import '../models/payment.dart';
import '../repository/payments_repository.dart';

class PaymentsPage extends StatefulWidget {
  const PaymentsPage({super.key});

  @override
  State<PaymentsPage> createState() => _PaymentsPageState();
}

class _PaymentsPageState extends State<PaymentsPage> {
  late List<Payment> payments;

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
                    'Meus pagamentos',
                    style: TextStyle(color: Color(0xFF35244E), fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 2)
                ],
              ),
            ),
            FutureBuilder<List<Payment>>(
              future: PaymentsRepository().getAll(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                } else if (!snapshot.hasData) {
                  return const DefaultCardMessage(message: 'Não há pagamentos cadastrados.');
                } else {
                  payments = snapshot.data!;
                  if (payments.isNotEmpty) {
                    return ListView.separated(
                      itemCount: payments.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return PaymentsListTile(
                          payment: payments[index],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 16,
                        );
                      },
                    );
                  } else {
                    return const DefaultCardMessage(message: 'Não há pagamentos cadastrados.');
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
        payments = payments;
      },
    );
  }
}
