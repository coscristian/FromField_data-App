import 'package:flutter/material.dart';

import '../../controller/request/login.dart';

class PasswordWidget extends StatefulWidget {
  bool obscureText;

  FormFieldSetter<String> save;

  PasswordWidget({super.key, required this.obscureText, required this.save});

  @override
  State<PasswordWidget> createState() => PasswordWidgetState();
}

class PasswordWidgetState extends State<PasswordWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        labelText: const Text(
          "Password",
          style: TextStyle(fontWeight: FontWeight.bold),
        ).data,
        suffixIcon: IconButton(
          icon: Icon(
              widget.obscureText ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              widget.obscureText = !widget.obscureText;
            });
          },
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Required Field";
        }

        if (!value.contains(RegExp(r'[A-Z]'), 0)) {
          return "Need at least UpperCase letter";
        }

        if (value.length < 7) {
          return "Minimun 7 characters";
        }
        return null;
      },
      onSaved: widget.save,
    );
  }
}
