import 'package:flutter/material.dart';

class MyStory extends StatelessWidget {
  final String? title;
  final String? image;

  const MyStory({super.key, required this.title, this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 8, left: 8),
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.green,
            backgroundImage: NetworkImage(image!),
          ),
          Text(title!)
        ],
      ),
    );
  }
}