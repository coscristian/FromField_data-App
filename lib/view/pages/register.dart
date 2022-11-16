import 'package:flutter/material.dart';

import '../../controller/register.dart';
import '../../controller/request/register.dart';
import '../../model/entity/user_type_account.dart';
import '../widgets/email_field.dart';
import '../widgets/password_field.dart';
import '../widgets/password_register_field.dart';
import '../widgets/terms_conditions.dart';
import '../widgets/user_account_type.dart';
import 'inicio.dart';

class RegisterPage extends StatelessWidget {
  late RegisterController _controller;
  late RegisterRequest _registerRequest;
  late UserAccountTypeWidget _userAccountTypeWidget;
  late TermsConditionsWidget _termsConditionsWidget;

  RegisterPage({super.key}) {
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
          EmailFieldWidget(
            labelText: "Email",
            hintText: "Your email address",
            save: (newValue) {
              _registerRequest.email = newValue!;
            },
          ),
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

  Widget _userNameField() {
    return TextFormField(
      obscureText: false,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        labelText: const Text(
          "Name",
          style: TextStyle(fontWeight: FontWeight.bold),
        ).data,
        hintText: "Username",
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Required Field";
        }
        if (value.length < 5) {
          return "Minimun 5 characters";
        }
        return null;
      },
      onSaved: (value) {
        _registerRequest.name = value!;
      },
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

  Widget _registerButton(GlobalKey<FormState> formKey, BuildContext context) {
    return SizedBox(
      width: 230,
      child: ElevatedButton(
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(Colors.brown),
        ),
        child: const Text("Create Accont"),
        onPressed: () {
          // Check if the textFormFiels are correct
          if (formKey.currentState!.validate()) {
            // Check if the checkbox(Terms and conditions) is selected
            if (_termsConditionsWidget.isChecked) {
              // Asign the corresponding info from an external widget
              _registerRequest.typeAcoount =
                  _userAccountTypeWidget.registerRequest.typeAcoount;
              // Save the form info
              formKey.currentState!.save();
              try {
                _controller.validateUser(_registerRequest);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainPage(
                        name: _registerRequest.name,
                        email: _registerRequest.email),
                  ),
                );
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content:
                        Text("There is a user registered with that Email!!"),
                  ),
                );
              }
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("You have to agree Terms and Conditions."),
                ),
              );
            }
          }
        },
      ),
    );
  }
}
