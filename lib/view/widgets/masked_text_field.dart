import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'default_text_field.dart';

class MaskedTextField extends StatelessWidget {
  const MaskedTextField(
      {super.key,
      required this.controller,
      required this.text,
      required this.icon,
      required this.isPasswordField,
      this.validator,
      this.keyboardType,
      required this.maskFormatter});

  final TextEditingController controller;
  final String text;
  final IconData icon;
  final bool isPasswordField;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final MaskTextInputFormatter maskFormatter;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      obscureText: isPasswordField,
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      inputFormatters: [maskFormatter],
      decoration: InputDecoration(
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
        hintText: text,
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
