import 'package:flutter/material.dart';

class MyRadio extends StatefulWidget {
  final ValueChanged<String?> value;

  const MyRadio({super.key, required this.value});

  @override
  State<MyRadio> createState() => _MyRadioState();
}

class _MyRadioState extends State<MyRadio> {
  String _value = "Masculino";

  @override
  Widget build(BuildContext context) {
    return RadioGroup(
      groupValue: _value,
      onChanged: (v){
        setState(() {
          _value = v.toString();
          widget.value(v.toString());
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            child: RadioListTile(
              value: "Masculino",
              title: Text("Masculino"),
              controlAffinity: ListTileControlAffinity.leading
            )
          ),

          Expanded(
            child: RadioListTile(
              value: "Feminino",
              title: Text("Feminino"),
              controlAffinity: ListTileControlAffinity.leading
            )
          ),
        ],
      )
    );
  }
}