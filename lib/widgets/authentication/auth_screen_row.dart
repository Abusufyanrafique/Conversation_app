import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthScreenRow extends StatelessWidget {
  final String imagePath;
  final String text;
  final VoidCallback? onTap;

  const AuthScreenRow({
    super.key,
    required this.imagePath,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          // ── Container with Image ──
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFEDE3D8),
              borderRadius: BorderRadius.circular(15.87),
              border: Border.all(
                color: Colors.white,
                width: 1.06
              )
            ),
            child: Center(
              child: Image.asset(
                imagePath,
                width: 20,
                height: 20,
              ),
            ),
          ),

          const SizedBox(width: 12),

          // ── Text ──
          Text(
            text,
            style: GoogleFonts.jost(
              fontSize: 11,
              fontWeight: FontWeight.w400,
              letterSpacing: 1.54,
              color: const Color(0xFF7A6F66),
            ),
          ),
        ],
      ),
    );
  }
}