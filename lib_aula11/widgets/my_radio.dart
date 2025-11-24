import 'package:flutter/material.dart';

class MyRadio extends StatefulWidget {
  const MyRadio({super.key});

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
        title: Text("Gênero"),
      ),
    );
  }
}