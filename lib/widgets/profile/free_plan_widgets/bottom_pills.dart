import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomPills extends StatelessWidget {
  const BottomPills({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.27),
          border: Border.all(
            color:  Colors.white,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Cancel anytime',
              style: GoogleFonts.jost(
                fontSize: 12,
                color: const Color(0xFF9E9890),
                fontWeight: FontWeight.w400,
              ),
            ),
            _Divider(),
            Text(
              'No hidden fees',
              style: GoogleFonts.jost(
                fontSize: 12,
                color: const Color(0xFF9E9890),
                fontWeight: FontWeight.w400,
              ),
            ),
            _Divider(),
            Text(
              'Secure checkout',
              style: GoogleFonts.jost(
                fontSize: 12,
                color: const Color(0xFF9E9890),
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      width: 1,
      height: 1,
      color: const Color(0xFFCFABA2).withOpacity(0.40),
    );
  }
}