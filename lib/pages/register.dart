import 'package:flutter/material.dart';
import 'package:from_field_data/widgets/password_field.dart';

import '../widgets/email_field.dart';

/*
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
      children: <Widget>[
        const Text(
          "Type",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        RadioListTile(
          title: const Text("Institucional"),
          value: UserTypeAccount.institucional,
          groupValue: _typeAccount,
          onChanged: (UserTypeAccount? value) {
            _typeAccount = value;
          },
        ),
        RadioListTile(
          title: const Text("Empresa"),
          value: UserTypeAccount.empresa,
          groupValue: _typeAccount,
          onChanged: (UserTypeAccount? value) {
            _typeAccount = value;
          },
        ),
        RadioListTile(
          title: const Text("Personal"),
          value: UserTypeAccount.personal,
          groupValue: _typeAccount,
          onChanged: (UserTypeAccount? value) {
            _typeAccount = value;
          },
        ),
      ],
    );
  }
}
*/
class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
    );
  }

  Widget _form(BuildContext context) {
    return Form(
      child: Column(
        children: [
          _userNameField(),
          const SizedBox(
            height: 15,
          ),
          EmailFieldWidget(
            labelText: "Email",
            hintText: "Your email address",
          ),
          const SizedBox(
            height: 15,
          ),
          PasswordWidget(obscureText: true),
          const SizedBox(
            height: 15,
          ),
          //const UserAccountTypeWidget(),
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
}
