import 'package:flutter/material.dart';

class MySettingsPage extends StatelessWidget {
  final String? title;
  
  const MySettingsPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
    );
  }
}