import 'package:conversation_app/Utils/app_text.dart' as AppText;
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
    final provider = context.watch<HomeProvider>();


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
        text: AppText.your,
        style: GoogleFonts.jost(
          fontSize: 20,
          color: Color(0xFF2B2622),
          fontWeight: FontWeight.w300,
        ),
      ),
      TextSpan(
        text: AppText.deck,
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
                    // Image(image: AssetImage(AppImages.homeandarrow)),
                    Text(
                      AppText.alldecks,
          style: GoogleFonts.jost(
          fontSize: 10,
          color: Color(0xFF7A6F66),
          fontWeight: FontWeight.w400,
          
        ),
                    ),
                    SizedBox(width: 3),
                    Icon(
                      Icons.arrow_right_alt, 
                      size: 10, 
                      color:Color(0xFF7A6F66)
                      ),
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
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
             return DeckTile(
             deck: decks[index],
             index: index,                         
             isPremiumView: provider.isPremiumView, 
             onTap: () {},
           );
            },
          ),
        ],
      ),
    );
  }
}