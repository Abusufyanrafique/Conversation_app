import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UnlockButton extends StatelessWidget {
  final bool isAnnual;
  const UnlockButton({super.key, required this.isAnnual});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2B2622),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.87),
          ),
        ),
        child: Text(
          isAnnual
              ? 'UNLOCK PREMIUM — \$59 / YEAR'
              : 'UNLOCK PREMIUM — \$6 / MONTH',
          style: GoogleFonts.jost(
            fontSize: 11,
            fontWeight: FontWeight.w400,
            color: Color(0xFFF1ECE5),
            letterSpacing: 1.98,
          ),
        ),
      ),
    );
  }
}