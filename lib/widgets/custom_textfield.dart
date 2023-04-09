import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final String obscuringCharacter;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final bool? isDense;
  const CustomTextField(
      {super.key,
      this.hintText,
      this.controller,
      this.obscureText = false,
      this.obscuringCharacter = '•',
      this.onChanged,
      this.validator,
      this.isDense = true});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      style: const TextStyle(color: Colors.white),
      controller: controller,
      obscureText: obscureText,
      obscuringCharacter: obscuringCharacter,
      decoration: InputDecoration(hintText: hintText, isDense: true),
    );
  }
}
