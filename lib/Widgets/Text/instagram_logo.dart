import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InstagramLogo extends StatelessWidget {
  const InstagramLogo({super.key, required this.textsize});

  final double textsize;

  @override
  Widget build(BuildContext context) {
    return Text("Instagram",
        style: GoogleFonts.grandHotel(
           fontSize: textsize,
          fontWeight: FontWeight.w500,

      color:  Theme.of(context).colorScheme.onSurface,
    ),);

  }
}
