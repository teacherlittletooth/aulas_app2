import 'package:flutter/material.dart';

class MyCard extends StatefulWidget {
  final String? title;
  final String? image;
  final bool? like;
  
  const MyCard({super.key, required this.title, required this.image, required this.like});

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 150,
          width: 250,
          child: FlutterLogo(),
        ),
        SizedBox(
          width: 250,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(widget.title!),
              IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border))
            ],
          ),
        )
      ],
    );
  }
}