import 'package:flutter/material.dart';

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
        // contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        isDense: true,
        filled: true,
        fillColor: const Color(0xFFF0EDF5),
        prefixIcon: Icon(icon),
        prefixIconConstraints:
            const BoxConstraints(minHeight: 32, minWidth: 32),
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
          color: Color(0xFF583290),
        )),
        hintText: hintText,
        hintStyle: const TextStyle(
          fontFamily: 'Lato',
          fontSize: 14,
        ),
      ),
      style: const TextStyle(
        fontFamily: 'Lato',
        fontSize: 14,
        color: Color(0xFF000000),
      ),
    );
  }
}
