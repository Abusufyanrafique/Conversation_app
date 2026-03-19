import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthHeaderSection extends StatelessWidget {
  final String topLabel;
  final String title;
  final String subtitle;
  final List<TextSpan>? titleSpans; 

  // top label styles
  final Color topLabelColor;
  final double topLabelFontSize;
  final FontWeight topLabelFontWeight;
  final double topLabelLetterSpacing;
  final FontStyle topLabelFontStyle;
  final TextStyle? topLabelStyle;

  // title styles
  final Color titleColor;
  final double titleFontSize;
  final FontWeight titleFontWeight;
  final double titleLetterSpacing;
  final double titleHeight;
  final FontStyle titleFontStyle;
  final TextStyle? titleStyle;

  // subtitle styles
  final Color subtitleColor;
  final double subtitleFontSize;
  final FontWeight subtitleFontWeight;
  final double subtitleLetterSpacing;
  final FontStyle subtitleFontStyle;
  final TextStyle? subtitleStyle;

  // spacing
  final double spaceBetweenTopAndTitle;
  final double spaceBetweenTitleAndSubtitle;

  const AuthHeaderSection({
    super.key,
    required this.topLabel,
    required this.title,
    required this.subtitle,
    this.titleSpans,

    // top label defaults
    this.topLabelColor = const Color(0xFFA09890),
    this.topLabelFontSize = 11,
    this.topLabelFontWeight = FontWeight.w400,
    this.topLabelLetterSpacing = 2.5,
    this.topLabelFontStyle = FontStyle.normal,
    this.topLabelStyle,

    // title defaults
    this.titleColor = const Color(0xFF221F1C),
    this.titleFontSize = 28,
    this.titleFontWeight = FontWeight.w600,
    this.titleLetterSpacing = 0.5,
    this.titleHeight = 1.2,
    this.titleFontStyle = FontStyle.normal,
    this.titleStyle,

    // subtitle defaults
    this.subtitleColor = const Color(0xFFA09890),
    this.subtitleFontSize = 13,
    this.subtitleFontWeight = FontWeight.w300,
    this.subtitleLetterSpacing = 0.3,
    this.subtitleFontStyle = FontStyle.normal,
    this.subtitleStyle,

    // spacing defaults
    this.spaceBetweenTopAndTitle = 10,
    this.spaceBetweenTitleAndSubtitle = 8,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Top Label ──
        Text(
          topLabel,
          style: topLabelStyle ??
              GoogleFonts.jost(
                fontSize: topLabelFontSize,
                color: topLabelColor,
                fontWeight: topLabelFontWeight,
                letterSpacing: topLabelLetterSpacing,
                fontStyle: topLabelFontStyle,
              ),
        ),

        // SizedBox(height: spaceBetweenTopAndTitle),

        // ── Title (RichText) ──
        RichText(
          text: TextSpan(
            style: titleStyle ??
                GoogleFonts.jost(
                  fontSize: titleFontSize,
                  color: titleColor,
                  fontWeight: titleFontWeight,
                  letterSpacing: titleLetterSpacing,
                  height: titleHeight,
                  fontStyle: titleFontStyle,
                ),
            children: titleSpans ?? [
              TextSpan(text: title),
            ],
          ),
        ),

        SizedBox(height: spaceBetweenTitleAndSubtitle),

        // ── Subtitle ──
        Text(
          subtitle,
          style: subtitleStyle ??
              GoogleFonts.jost(
                fontSize: subtitleFontSize,
                color: subtitleColor,
                fontWeight: subtitleFontWeight,
                letterSpacing: subtitleLetterSpacing,
                fontStyle: subtitleFontStyle,
              ),
        ),
      ],
    );
  }
}