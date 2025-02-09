import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InstaTextStyle extends StatelessWidget {
  const InstaTextStyle({super.key,required this.text});

  final String text;


  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.montserrat(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
    );
  }
}