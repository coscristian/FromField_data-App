import 'package:flutter/material.dart';

class PasswordWidget extends StatefulWidget {
  bool obscureText;
  PasswordWidget({super.key, required this.obscureText});

  @override
  State<PasswordWidget> createState() => PasswordWidgetState();
}

class PasswordWidgetState extends State<PasswordWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        labelText: const Text(
          "Password",
          style: TextStyle(fontWeight: FontWeight.bold),
        ).data,
        suffixIcon: IconButton(
          icon: Icon(widget.obscureText ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              widget.obscureText = !widget.obscureText;
            });
          },
        ),
      ),
    );
  }
}
