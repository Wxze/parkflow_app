import 'package:flutter/material.dart';
import 'package:parkflow_app/models/vacancy.dart';

class VacancyCard extends StatefulWidget {
  const VacancyCard(
      {super.key,
      required this.vacancy});
  final Vacancy vacancy;

  @override
  State<VacancyCard> createState() => _VacancyCardState();
}

class _VacancyCardState extends State<VacancyCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Color(0xFF69479B), width: 5),
          ),
        ),
        width: 165,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Vaga',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              // '5A',
              '${widget.vacancy.number} ${widget.vacancy.sectionName}',
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF583290)),
            ),
          ],
        ),
      ),
    );
  }
}
