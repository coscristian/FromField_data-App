import 'package:flutter/material.dart';

import '../../controller/login.dart';
import '../../controller/register.dart';
import '../../controller/request/register.dart';
import '../widgets/password_field.dart';
import '../widgets/terms_conditions.dart';
import '../widgets/text_field.dart';
import '../widgets/user_account_type.dart';
import 'inicio.dart';

class RegisterPage extends StatelessWidget {
  late RegisterController _controller;
  late LoginController _loginController;
  late RegisterRequest _registerRequest;
  late UserAccountTypeWidget _userAccountTypeWidget;
  late TermsConditionsWidget _termsConditionsWidget;

  RegisterPage({super.key}) {
    _loginController = LoginController();
    _controller = RegisterController();
    _registerRequest = RegisterRequest();
    _userAccountTypeWidget = UserAccountTypeWidget();
    _termsConditionsWidget = TermsConditionsWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 25,
              ),
              _title(),
              const SizedBox(
                height: 15,
              ),
              _form(context),
            ],
          ),
        ),
      ),
    );
  }

  String? validateEmailField(String? value) {
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
  }

  Widget _emailField() {
    return TextFieldWidget(
      obscureText: false,
      decoration: InputDecoration(
        labelText: const Text(
          "Email",
          style: TextStyle(fontWeight: FontWeight.bold),
        ).data,
        hintText: "Your email Address",
      ),
      keyboardType: TextInputType.emailAddress,
      validator: validateEmailField,
      save: (value) => _registerRequest.email = value!,
    );
  }

  Widget _form(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Column(
        children: [
          _userNameField(),
          const SizedBox(
            height: 35,
          ),
          _emailField(),
          const SizedBox(
            height: 35,
          ),
          PasswordWidget(
            obscureText: true,
            save: (newValue) {
              _registerRequest.password = newValue!;
            },
          ),
          const SizedBox(
            height: 35,
          ),
          _userAccountTypeWidget,
          const SizedBox(
            height: 35,
          ),
          _termsConditionsWidget,
          const SizedBox(
            height: 25,
          ),
          _registerButton(formKey, context),
        ],
      ),
    );
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "Required Field";
    }
    if (value.length < 5) {
      return "Minimun 5 characters";
    }
    return null;
  }

  Widget _userNameField() {
    return TextFieldWidget(
      obscureText: false,
      decoration: InputDecoration(
        labelText: const Text(
          "Name",
          style: TextStyle(fontWeight: FontWeight.bold),
        ).data,
        hintText: "Username",
      ),
      keyboardType: TextInputType.name,
      validator: validateName,
      save: (value) => _registerRequest.name = value!,
    );
  }

  Widget _title() {
    return const Text(
      "Register",
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  void _registerUser(BuildContext context) async {
    try {
      // Register User on Firebase.
      // Como registerNewUser retorna un Future(Promesa) debo usar los métodos
      //    * .then() para que se ejecute la función dada si el retorno de el Future es exitoso
      //    * .onError() para que se ejecute la función dada si el retorno del Future es con error

      await _controller.registerNewUser(_registerRequest);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Usuario Registrado Correctamente.")),
      );
      // Despues de mostrar el mensaje, devuelvase a la pagina anterior
      Navigator.pop(context);
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.toString()),
        ),
      );
    }
  }

  void _validateUser(GlobalKey<FormState> formKey, BuildContext context) {
    // Check if the textFormFiels are correct
    if (formKey.currentState!.validate()) {
      // Check if the checkbox(Terms and conditions) is selected
      if (_termsConditionsWidget.isChecked) {
        // Asign the corresponding info from an external widget
        _registerRequest.typeAccount =
            _userAccountTypeWidget.registerRequest.typeAccount;
        // Save the form info
        formKey.currentState!.save();
        _registerUser(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("You have to agree Terms and Conditions."),
          ),
        );
      }
    }
  }

  Widget _registerButton(GlobalKey<FormState> formKey, BuildContext context) {
    return SizedBox(
      width: 230,
      child: ElevatedButton(
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(Colors.brown),
        ),
        child: const Text("Create Accont"),
        onPressed: () {
          _validateUser(formKey, context);
        },
      ),
    );
  }
}
