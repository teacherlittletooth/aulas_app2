import 'package:flutter/material.dart';

class MyCheckbox extends StatefulWidget {
  final String? title;

  const MyCheckbox({super.key, required this.title});

  @override
  State<MyCheckbox> createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CheckboxListTile(
        value: false,
        onChanged: (b) {},
        title: Text(widget.title!),
        controlAffinity: ListTileControlAffinity.leading,
      )
    );
  }
}
