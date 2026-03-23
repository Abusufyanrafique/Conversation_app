import 'package:conversation_app/providers/home/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'deck_tile.dart';

class YourDecksSection extends StatelessWidget {
  const YourDecksSection({super.key});

  @override
  Widget build(BuildContext context) {
    final decks = context.watch<HomeProvider>().decks;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            RichText(
  text: TextSpan(
    children: [
      TextSpan(
        text: 'Your ',
        style: GoogleFonts.jost(
          fontSize: 20,
          color: Color(0xFF2B2622),
          fontWeight: FontWeight.w300,
        ),
      ),
      TextSpan(
        text: 'Decks',
        style: GoogleFonts.jost(
          fontSize: 20,
          color: Color(0xFF9E9890),
          fontWeight: FontWeight.w300,
          
        ),
      ),
    ],
  ),
),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children:  [
                    Text(
                      'All decks',
          style: GoogleFonts.jost(
          fontSize: 10,
          color: Color(0xFF7A6F66),
          fontWeight: FontWeight.w300,
          
        ),
                    ),
                    SizedBox(width: 3),
                    Icon(Icons.arrow_back_ios_new, size: 10, color:Color(0xFF7A6F66)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          // Decks 2-column grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: decks.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.15,
            ),
            itemBuilder: (context, index) {
              return DeckTile(
                deck: decks[index],
                onTap: () {},
              );
            },
          ),
        ],
      ),
    );
  }
}