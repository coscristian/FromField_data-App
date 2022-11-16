import 'package:flutter/material.dart';
import 'package:from_field_data/controller/request/register.dart';

import '../../controller/request/login.dart';

class PasswordRegisterWidget extends StatefulWidget {
  bool obscureText;
  late RegisterRequest registerRequest;
  //Function save;

  PasswordRegisterWidget({
    super.key,
    required this.obscureText,
    /*required this.save*/
  }) {
    registerRequest = RegisterRequest();
  }

  @override
  State<PasswordRegisterWidget> createState() => PasswordWidgetState();
}

class PasswordWidgetState extends State<PasswordRegisterWidget> {
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
      //onSaved: widget.save(),
      
      onSaved: (value) {
        widget.registerRequest.password = value!;
      },
    );
  }
}
