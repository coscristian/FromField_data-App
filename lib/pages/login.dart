import 'package:flutter/material.dart';

import '../widgets/password.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  //var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool _obscureText = true;
    String _password;

    return Scaffold(
      //backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 50,
              ),
              Image.asset(
                "assets/images/logoLogin.png",
                width: 300,
                height: 300,
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                obscureText: false,
                decoration: InputDecoration(
                  labelText: const Text(
                    "Username or Email",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ).data,
                  hintText: "example@email.com",
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              PasswordWidget(obscureText: true),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 230,
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Colors.brown),
                  ),
                  onPressed: () {},
                  child: const Text("Login"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text("Register a new Account"),
              const SizedBox(
                height: 10,
              ),
              const Text("Forgot my password"),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.asset("assets/images/google.png"),
                  ),
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: Image.asset("assets/images/facebook.png"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
