import 'package:flutter/material.dart';

class DefaultVacancyCardMessage extends StatelessWidget {
  final String message;

  const DefaultVacancyCardMessage({Key? key, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        // margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        elevation: 3,
        child: ClipPath(
          clipper: ShapeBorderClipper(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.10,
            decoration: const BoxDecoration(color: Colors.white),
            child: Center(
              child: Text(
                message,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF35244E)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
