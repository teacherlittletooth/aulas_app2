import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTitle extends StatelessWidget {
  final String? title;

  const MyTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsetsGeometry.only(bottom: 8),
        child: Text(
          title!,
          style: GoogleFonts.uchen(
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
        ),
      );
    }
}