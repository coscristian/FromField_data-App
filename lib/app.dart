import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:from_field_data/pages/login.dart';

import 'pages/register.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "From Field Data",
      home: RegisterPage(),
    );
  }
}
