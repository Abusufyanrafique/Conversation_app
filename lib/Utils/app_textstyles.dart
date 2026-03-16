import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  // Generic function to get Jost TextStyle with weight
  static TextStyle jost({
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.w400,
    double? height,
    double letterSpacing = 0,
    Color color = Colors.black,
  }) {
    return GoogleFonts.jost(
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: height ?? (fontSize * 1.2 / fontSize),
      letterSpacing: letterSpacing,
      color: color,
    );
  }

  // Predefined styles
  static TextStyle headingLarge = jost(
    fontSize: 48,
    fontWeight: FontWeight.w300, // Light
    height: 50.88 / 48,
  );

  static TextStyle headingMedium = jost(
    fontSize: 32,
    fontWeight: FontWeight.w400, // Regular
    height: 36 / 32,
  );

  static TextStyle headingMediumBold = jost(
    fontSize: 32,
    fontWeight: FontWeight.w600, // SemiBold
    height: 36 / 32,
  );

  static TextStyle body = jost(
    fontSize: 16,
    fontWeight: FontWeight.w400, // Regular
    height: 20 / 16,
    letterSpacing: 0.5,
    color: Colors.black87,
  );
}