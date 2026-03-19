import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 53,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Color(0xFF2B2622),
          borderRadius: BorderRadius.circular(15.87),
        ),
        child: Center(
          child: Text(
            text,
           style: GoogleFonts.jost(
                      fontSize: 12,
                      letterSpacing:0.55,
                      color: const Color(0xFFEFE7DE),
                      fontWeight: FontWeight.w400,
                    ),
          ),
        ),
      ),
    );
  }
}