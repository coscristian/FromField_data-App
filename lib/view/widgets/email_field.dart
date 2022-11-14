import 'package:flutter/material.dart';

class EmailFieldWidget extends StatelessWidget {
  String labelText;
  String hintText;

  EmailFieldWidget({
    super.key,
    required this.labelText,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: false,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: Text(
          labelText,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ).data,
        hintText: hintText,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Required Field";
        }
        if (!value.contains(".") || !value.contains("@")) {
          return "Invalid Email";
        }
        if (value.length < 5) {
          return "Minimun 5 characters";
        }
        return null;
      },
    );
  }
}