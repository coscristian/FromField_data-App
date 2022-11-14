import 'package:flutter/material.dart';
import 'package:from_field_data/view/pages/register.dart';

import '../../controller/login.dart';
import '../../controller/request/login.dart';
import '../../controller/request/register.dart';
import '../widgets/email_field.dart';
import '../widgets/password_field.dart';
import 'inicio.dart';

class LoginPage extends StatelessWidget {
  late LoginController _controller;
  late LoginRequest _loginRequest;
  late PasswordLoginWidget _passwordLoginWidget;

  LoginPage({super.key}) {
    _controller = LoginController();
    _loginRequest = LoginRequest();
    _passwordLoginWidget = PasswordLoginWidget(obscureText: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color(0xEDE6F0),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 50,
              ),
              _image(),
              const SizedBox(
                height: 30,
              ),
              _form(context),
              const SizedBox(
                height: 15,
              ),
              _options(context),
              _alternativeLogin(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _image() {
    return Image.asset(
      "assets/images/logoLogin.png",
      width: 300,
      height: 300,
    );
  }

  Widget _form(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Column(
        children: <Widget>[
          _emailField(),
          const SizedBox(
            height: 30,
          ),
          _passwordLoginWidget,
          const SizedBox(
            height: 30,
          ),
          _loginButton(formKey, context),
        ],
      ),
    );
  }

  Widget _emailField() {
    return TextFormField(
      obscureText: false,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: const Text(
          "Email",
          style: TextStyle(fontWeight: FontWeight.bold),
        ).data,
        hintText: "Your email address",
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
      onSaved: (value) {
        _loginRequest.email = value!;
      },
    );
  }

  Widget _loginButton(GlobalKey<FormState> formKey, BuildContext context) {
    return SizedBox(
      width: 230,
      child: ElevatedButton(
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(Colors.brown),
        ),
        child: const Text("Login"),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            _loginRequest.password = _passwordLoginWidget.loginRequest.password;
            try {
              var name = _controller.validateEmailPassword(_loginRequest);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      MainPage(name: name, email: _loginRequest.email),
                ),
              );
            } catch (e) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(e.toString())));
            }
          }
        },
      ),
    );
  }

  Widget _options(BuildContext context) {
    return Column(
      children: [
        TextButton(
          style: TextButton.styleFrom(foregroundColor: Colors.brown),
          child: const Text("Register a new Account"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RegisterPage(),
              ),
            );
          },
        ),
        TextButton(
          style: TextButton.styleFrom(foregroundColor: Colors.brown),
          child: const Text("Forgot my password"),
          onPressed: () {},
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }

  Widget _alternativeLogin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          icon: Image.asset("assets/images/google.png"),
          iconSize: 30,
          onPressed: () {},
        ),
        IconButton(
          icon: Image.asset("assets/images/facebook.png"),
          iconSize: 30,
          onPressed: () {},
        ),
      ],
    );
  }
}

class PasswordLoginWidget extends StatefulWidget {
  bool obscureText;
  late LoginRequest loginRequest;

  PasswordLoginWidget({super.key, required this.obscureText}) {
    loginRequest = LoginRequest();
  }

  @override
  State<PasswordLoginWidget> createState() => PasswordWidgetState();
}

class PasswordWidgetState extends State<PasswordLoginWidget> {
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
      onSaved: (value) {
        widget.loginRequest.password = value!;
      },
    );
  }
}
