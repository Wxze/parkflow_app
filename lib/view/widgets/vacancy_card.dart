import 'package:flutter/material.dart';
import 'package:parkflow_app/models/vacancy.dart';

class VacancyCard extends StatefulWidget {
  const VacancyCard(
      {super.key,
      required this.vacancy,
      required this.onCardTapped,
      required this.isSelected});
  final Vacancy vacancy;
  final bool isSelected;
  final Function onCardTapped;

  @override
  State<VacancyCard> createState() => _VacancyCardState();
}

class _VacancyCardState extends State<VacancyCard> {
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
                '${widget.vacancy.number} ${widget.vacancy.sectionName}',
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
