import 'package:ecommerce/shared_style/shared_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SharedStyle {
  static TextStyle cardTitleFiraSans12WithLetterSpacing =
      GoogleFonts.firaSans(fontSize: 12, letterSpacing: 2);
  static TextStyle cardHeadingFiraSans20 = GoogleFonts.firaSans(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: SharedColors().bodyColorBlue);
}
