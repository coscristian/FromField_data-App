import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:from_field_data/view/pages/login.dart';

import 'view/pages/register.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "From Field Data",
      home: LoginPage(),
    );
  }
}
