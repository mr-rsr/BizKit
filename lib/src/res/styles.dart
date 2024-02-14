import 'package:bizkit/src/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle customTextStyle(double fontSize,
    {Color? color, FontWeight? fontWeight}) {
  return GoogleFonts.merriweather(
    color: color ?? lightTextColor,
    fontSize: fontSize,
    fontWeight: fontWeight ?? FontWeight.normal,
  );
}
