import 'package:flutter/material.dart';

class MyRadio extends StatefulWidget {
  final String? title;

  const MyRadio({super.key, required this.title});

  @override
  State<MyRadio> createState() => _MyRadioState();
}

class _MyRadioState extends State<MyRadio> {
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RadioListTile(
        groupValue: 1,
        onChanged: (v)=> _value = v!,
        value: _value,
        title: Text(widget.title!),
      ),
    );
  }
}