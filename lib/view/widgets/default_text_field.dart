import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultTextField extends StatelessWidget {
  const DefaultTextField({
    super.key,
    required this.icon,
    required this.hintText,
    required this.isPasswordField,
  });

  final IconData icon;
  final String hintText;
  final bool isPasswordField;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      obscureText: isPasswordField,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 0.00001,
        ),
        filled: true,
        fillColor: const Color(0xFFF0EDF5),
        prefixIcon: Icon(icon),
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
          color: Color(0xFF583290),
        )),
        hintText: hintText,
        hintStyle: GoogleFonts.lato(
          fontSize: 14,
        ),
      ),
      style: GoogleFonts.lato(
        fontSize: 14,
        color: const Color(0xFF000000),
      ),
    );
  }
}
