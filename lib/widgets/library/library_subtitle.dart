import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LibrarySubtitle extends StatelessWidget {
  const LibrarySubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(
            '14 DECKS ACROSS 5 CATEGORIES',
            style: GoogleFonts.jost(
              fontSize: 10,
              letterSpacing: 0.52,
              color: Color(0xFF9E9890),
              fontWeight: FontWeight.w300,
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Container(
              height: 0.98,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0x2E9E9890), // #9E98902E - 18% opacity
                    Color(0x009E9890), // #9E989000 - 0% opacity
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}