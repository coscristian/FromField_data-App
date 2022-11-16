import 'package:flutter/material.dart';

class TermsConditionsWidget extends StatefulWidget {
  bool isChecked = false;
  TermsConditionsWidget({super.key});

  @override
  State<StatefulWidget> createState() => TermsConditionsWidget2();
}

class TermsConditionsWidget2 extends State<TermsConditionsWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 30.0,
          child: Checkbox(
            value: widget.isChecked,
            onChanged: (bool? value) {
              setState(() {
                widget.isChecked = value!;
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
