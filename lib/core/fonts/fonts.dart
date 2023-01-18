import 'package:blush/core/color/colours.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class GoogleFont {
  static TextStyle loginMainTextStle = GoogleFonts.poppins(
      fontSize: 34, fontWeight: FontWeight.w700, color: commonColorYellow);

  static TextStyle buttonTextStyle = GoogleFonts.poppins(
      fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white);

  static TextStyle createAnAccountText = GoogleFonts.abel(
      fontSize: 18, fontWeight: FontWeight.w600, color: commonColorYellow);

  static TextStyle homeScreenText = GoogleFonts.abel(
      fontSize: 15, fontWeight: FontWeight.w800, color: commonColorYellow);

  static TextStyle splashScreenText = GoogleFonts.abel(
      fontSize: 15, fontWeight: FontWeight.w800, color: Colors.white);

  static TextStyle splashScreenMainText = GoogleFonts.poppins(
      fontSize: 34, fontWeight: FontWeight.w700, color: commonColorYellow);
}
