import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextfield extends StatelessWidget {
  int? maxLength;
  final String hintText;
  final bool isSecure;
  bool? enable;
  final String labelText;
  Widget? suffixIcon;
  FormFieldValidator? validator;
  TextInputType? textInputType;
  final TextEditingController controller;
  CustomTextfield({super.key, this.maxLength, required this.labelText, this.enable = true, required this.hintText, required this.isSecure, this.validator, required this.controller, this.suffixIcon, this.textInputType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      keyboardType: textInputType,
      enabled: enable,
      controller: controller,
      validator: validator,
      obscureText: isSecure,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        labelText: labelText,
      ),
    );
  }
}
