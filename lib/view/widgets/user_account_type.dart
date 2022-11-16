import 'package:flutter/material.dart';

import '../../controller/request/register.dart';
import '../../model/entity/user_type_account.dart';

class UserAccountTypeWidget extends StatefulWidget {
  late RegisterRequest registerRequest;
  UserTypeAccount typeAccount = UserTypeAccount.institucional;

  UserAccountTypeWidget({super.key}) {
    registerRequest = RegisterRequest();
  }

  @override
  State<UserAccountTypeWidget> createState() => _UserAccountTypeWidget();
}

class _UserAccountTypeWidget extends State<UserAccountTypeWidget> {
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
          groupValue: widget.typeAccount,
          onChanged: (UserTypeAccount? value) {
            setState(() {
              widget.typeAccount = value!;
              widget.registerRequest.typeAcoount = value;
            });
          },
        ),
        RadioListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text("Empresa"),
          value: UserTypeAccount.empresa,
          groupValue: widget.typeAccount,
          onChanged: (UserTypeAccount? value) {
            setState(() {
              widget.typeAccount = value!;
              widget.registerRequest.typeAcoount = value;
            });
          },
        ),
        RadioListTile(
          contentPadding: EdgeInsets.zero,
          title: const Text("Personal"),
          value: UserTypeAccount.personal,
          groupValue: widget.typeAccount,
          onChanged: (UserTypeAccount? value) {
            setState(() {
              widget.typeAccount = value!;
              widget.registerRequest.typeAcoount = value;
            });
          },
        ),
      ],
    );
  }
}
