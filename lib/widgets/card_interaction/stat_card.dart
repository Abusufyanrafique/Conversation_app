import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StatCard extends StatelessWidget {
  final int count;
  final String label;

  const StatCard({
    super.key,
    required this.count,
    required this.label,
  });

  static const Color cardBg = Color(0xFFEFE7DE);
  static const Color borderColor = Color(0xFFFFFFFF);
  static const Color textDark = Color(0xFF2A1C1A);
  static const Color textMuted = Color(0xFFB09490);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 98,
      padding: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(14.87),
        border: Border.all(color: borderColor, width: 1),
      ),
      child: Column(
        children: [
          Text(
            '$count',
            style: GoogleFonts.cormorantGaramond(
            fontSize: 24,
            color: Color(0xFF1C1B1A),
            fontWeight: FontWeight.w300,
  ),
          ),
          const SizedBox(height: 3),
          Text(
            label,
             style: GoogleFonts.jost(
              fontSize:8.58,
              color: Color(0xFF9C9590),
            fontWeight: FontWeight.w400,
  ),
          ),
        ],
      ),
    );
  }
}