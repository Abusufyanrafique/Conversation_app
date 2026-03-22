// CARD TITLE ROW WIDGET
// ─────────────────────────────────────────
 
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardTitleRow extends StatelessWidget {
  final String title;
  final int cardCount;
  final Color color;
 
  const CardTitleRow({
    super.key,
    required this.title,
    required this.cardCount,
    required this.color,
  });
 
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
           style: GoogleFonts.jost(
                 fontSize:24,
                 letterSpacing: 1.3,
                 color: Colors.white,
                 fontWeight: FontWeight.w300,
                
                        ),
        ),
        Text(
          '$cardCount cards',
          style: GoogleFonts.jost(
                 fontSize:12,
                 color: Colors.white,
                 fontWeight: FontWeight.w400,
                
                        ),
        ),
      ],
    );
  }
}
 