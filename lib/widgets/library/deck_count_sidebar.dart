import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeckCountSidebar extends StatelessWidget {
  final int deckCount;
  final Color color;
  final String imagepath;

  const DeckCountSidebar({
    super.key,
    required this.deckCount,
    required this.color,
    required this.imagepath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ── Image ──
          Image.asset(
            imagepath,
            width: 18,
            height: 18,
            fit: BoxFit.contain,
          ),

          const SizedBox(height: 10),

          // ── Rotated deck count text ──
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              '$deckCount DECKS',
              textAlign: TextAlign.center,
             style: GoogleFonts.jost(
                 fontSize:8.48,
                 letterSpacing: 0.85,
                 color: Colors.white.withOpacity(0.55),
                 fontWeight: FontWeight.w400,
                
                        ),
            ),
          ),
        ],
      ),
    );
  }
}