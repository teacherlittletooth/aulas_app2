import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final String? title;

  const MyTextField({super.key, required this.title});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        label: Text(widget.title!),
        border: OutlineInputBorder(),
      ),
    );
  }
}