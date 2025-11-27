import 'package:flutter/material.dart';

class MySlider extends StatefulWidget {
  const MySlider({super.key});

  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  @override
  Widget build(BuildContext context) {
    return Slider(
      value: 0, 
      onChanged: (d) {}
    );
  }
}