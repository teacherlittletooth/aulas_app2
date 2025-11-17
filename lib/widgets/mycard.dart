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
  
  bool likeState = false;

  void _changeLike() {
    setState(() {
      likeState = !likeState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(
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
              IconButton(
                onPressed: _changeLike,
                icon: (likeState) ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border)
              )
            ],
          ),
        )
      ],
    );
  }
}