import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  late String? name;
  late String? email;

  MainPage({super.key, this.name, this.email});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Main Page"),
      ),
    );
  }
}
