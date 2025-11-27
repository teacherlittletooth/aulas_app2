import 'package:flutter/material.dart';

class MySwitch extends StatefulWidget {
  final String? title;

  const MySwitch({super.key, required this.title});

  @override
  State<MySwitch> createState() => _MySwitchState();
}

class _MySwitchState extends State<MySwitch> {
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: false,
      onChanged: (b) {},
      title: Text(widget.title!),
    );
  }
}