import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final String obscuringCharacter;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final FormFieldValidator<String>? validator;
  final bool? isDense;
  final InputDecoration? decoration;
  final int? maxLine;
  final bool readOnly;
  const CustomTextField(
      {super.key,
      this.hintText,
      this.controller,
      this.obscureText = false,
      this.obscuringCharacter = '•',
      this.onChanged,
      this.validator,
      this.isDense = true,
      this.decoration,
      this.maxLine = 1,
      this.onTap,
      this.readOnly = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      onTap: onTap,
      maxLines: maxLine,
      readOnly: readOnly,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      style: const TextStyle(color: Colors.white),
      controller: controller,
      obscureText: obscureText,
      obscuringCharacter: obscuringCharacter,
      decoration:
          decoration ?? InputDecoration(hintText: hintText, isDense: true),
    );
  }
}
