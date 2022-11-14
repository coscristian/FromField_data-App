import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  final String name;
  final String email;

  const MainPage({super.key, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main Page"),
      ),
    );
  }
}
