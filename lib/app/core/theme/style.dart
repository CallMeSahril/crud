import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


const double defaultMargin = 20.0;

final h1 = GoogleFonts.inter(fontSize: 32.0, fontWeight: FontWeight.w700);
final h2 = GoogleFonts.inter(fontSize: 28.0, fontWeight: FontWeight.w700);
final h3 = GoogleFonts.inter(fontSize: 26.0, fontWeight: FontWeight.w700);
final h4 = GoogleFonts.inter(fontSize: 24.0, fontWeight: FontWeight.w600);
final h5 = GoogleFonts.inter(fontSize: 20.0, fontWeight: FontWeight.w600);
final h6 = GoogleFonts.inter(fontSize: 18.0, fontWeight: FontWeight.w700);
final b1 = GoogleFonts.inter(fontSize: 16.0, fontWeight: FontWeight.w400);
final b2 = GoogleFonts.inter(fontSize: 14.0, fontWeight: FontWeight.w400);
final b3 = GoogleFonts.inter(fontSize: 12.0, fontWeight: FontWeight.w400);

final rounded20 = BorderRadius.circular(20);
final rounded10 = BorderRadius.circular(10);


const shadowSm = BoxShadow(offset: Offset(0.0, 1.0), blurRadius: 2.0, color: Color.fromARGB(5, 0, 0, 0));

const shadowV2Xl = [
  BoxShadow(
    offset: Offset(0.0, 1.0),
    blurRadius: 10.0,
    spreadRadius: 0,
    color: Color.fromRGBO(0, 0, 0, 0.04),
  ),
  BoxShadow(
    offset: Offset(0.0, 1.0),
    blurRadius: 10.0,
    spreadRadius: -5,
    color: Color.fromRGBO(0, 0, 0, 0.1),
  ),
];

// Gradient Colors
const gradientGrey = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [Color(0xFFA8A8A8), Color(0xFF757575)],
);

// V1 Light Mode

Color colorsWhite = Colors.white;
Color colorBlack = Colors.black;