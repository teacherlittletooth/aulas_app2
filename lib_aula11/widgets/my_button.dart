import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String? title;
  final IconData? icon;

  const MyButton({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {},
         label: Text(title!),
         icon: Icon(icon!),
      ),
    );
  }
}