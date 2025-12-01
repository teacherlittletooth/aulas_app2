import 'package:flutter/material.dart';

class MySwitch extends StatefulWidget {
  final ValueChanged<bool?> value;
  final String? title;

  const MySwitch({super.key, required this.title, required this.value});

  @override
  State<MySwitch> createState() => _MySwitchState();
}

class _MySwitchState extends State<MySwitch> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: _value,
      onChanged: (b){
        setState(() {
          _value = b;
          widget.value(b);
        });
      },
      title: Text(widget.title!),
    );
  }
}