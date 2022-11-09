import 'package:flutter/material.dart';
import 'package:from_field_data/widgets/password_field.dart';

import '../widgets/email_field.dart';
import 'inicio.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
          ),
          const SizedBox(
            height: 35,
          ),
          PasswordWidget(obscureText: true),
          const SizedBox(
            height: 35,
          ),
          const UserAccountTypeWidget(),
          const SizedBox(
            height: 35,
          ),
          const TermsConditionsWidget(),
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
            if (_TermsConditionsWidget.isChecked!) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainPage(),
                ),
              );
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

enum UserTypeAccount { institucional, empresa, personal }

class UserAccountTypeWidget extends StatefulWidget {
  const UserAccountTypeWidget({super.key});

  @override
  State<UserAccountTypeWidget> createState() => _UserAccountTypeWidget();
}

class _UserAccountTypeWidget extends State<UserAccountTypeWidget> {
  UserTypeAccount? _typeAccount = UserTypeAccount.institucional;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          "Type",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        RadioListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text("Institucional"),
          value: UserTypeAccount.institucional,
          groupValue: _typeAccount,
          onChanged: (UserTypeAccount? value) {
            setState(() {
              _typeAccount = value;
            });
          },
        ),
        RadioListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text("Empresa"),
          value: UserTypeAccount.empresa,
          groupValue: _typeAccount,
          onChanged: (UserTypeAccount? value) {
            setState(() {
              _typeAccount = value;
            });
          },
        ),
        RadioListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text("Personal"),
          value: UserTypeAccount.personal,
          groupValue: _typeAccount,
          onChanged: (UserTypeAccount? value) {
            setState(() {
              _typeAccount = value;
            });
          },
        ),
      ],
    );
  }
}

class TermsConditionsWidget extends StatefulWidget {
  const TermsConditionsWidget({super.key});

  @override
  State<StatefulWidget> createState() => _TermsConditionsWidget();
}

class _TermsConditionsWidget extends State<TermsConditionsWidget> {
  static bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 30.0,
          child: Checkbox(
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value;
              });
            },
          ),
        ),
        const Text(
          "Estoy de acuerdo con los términos de\nservicios y politicas de privaciad.",
        ),
      ],
    );
  }
}
