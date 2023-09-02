import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Circle extends StatelessWidget {
  const Circle({super.key, required this.text, required this.isTrue});

  final String text;
  final bool isTrue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: isTrue ? Colors.blue :const Color.fromARGB(255, 199, 76, 84),
          borderRadius: BorderRadius.circular(100)),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.lato(
          color: const Color.fromARGB(255, 78, 13, 151),
          // fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
