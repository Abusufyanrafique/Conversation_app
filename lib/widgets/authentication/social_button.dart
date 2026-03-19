import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialButton extends StatelessWidget {
  final String text;
  final String? imagepath;
  final VoidCallback onTap;

  const SocialButton({
    super.key,
    required this.text,
    required this.onTap,
    this.imagepath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: const Color(0xFFF4EFEA).withOpacity(0.1),
          borderRadius: BorderRadius.circular(15.87),
          border: Border.all(
            color: Colors.white,
            width: 1.06,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imagepath != null)
              Image.asset(
                imagepath!,
                width: 24,
                height: 24,
              ),
            if (imagepath != null) const SizedBox(width: 10),
            Text(
              text,
              style: GoogleFonts.jost(
                fontSize: 13,
                letterSpacing: 0.52,
                color: const Color(0xFF2B2622),
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}