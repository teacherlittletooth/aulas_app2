import 'package:flutter/material.dart';

class MyCheckbox extends StatefulWidget {
  final ValueChanged<String> value;
  final String? title;
  
  const MyCheckbox({super.key, required this.title, required this.value});

  @override
  State<MyCheckbox> createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CheckboxListTile(
        value: _value,
        onChanged: (b) {
          setState(() {
            _value = b!;
            widget.value(widget.title!);
          });
        },
        title: Text(widget.title!),
        controlAffinity: ListTileControlAffinity.leading,
      )
    );
  }
}