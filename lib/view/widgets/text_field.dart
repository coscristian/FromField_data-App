import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  bool obscureText;
  TextInputType? keyboardType;
  InputDecoration? decoration;
  FormFieldValidator<String>? validator;
  FormFieldValidator<String>? save;

  TextFieldWidget({
    super.key,
    required this.obscureText,
    this.keyboardType,
    this.decoration,
    this.validator,
    this.save,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: decoration,
      validator: validator,
      onSaved: save,
    );
  }
}
