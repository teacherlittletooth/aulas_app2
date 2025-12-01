import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final VoidCallback? onClick;

  const MyButton({super.key, required this.title, required this.icon, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onClick!,
        label: Text(title!),
        icon: Icon(icon!),
      )
    );
  }
}