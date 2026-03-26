import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Subscription renews automatically. Manage or cancel at any time in your device settings.',
          textAlign: TextAlign.center,
          style: GoogleFonts.jost(
            fontSize: 9,
            color: const Color(0xFF9C9890),
            fontWeight: FontWeight.w400,
           
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {},
              child: Text(
                'Privacy Policy',
                style: GoogleFonts.jost(
                  fontSize: 8.9,
                  color: const Color(0xFF9C9890),
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.8,
                ),
              ),
            ),
            const SizedBox(width: 16),
            GestureDetector(
              onTap: () {},
              child: Text(
                'Terms of Service',
                style: GoogleFonts.jost(
                  fontSize: 8.5,
                  color: const Color(0xFF9E9890),
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.8,
                
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}