import 'package:conversation_app/Utils/app_colors.dart';
import 'package:conversation_app/models/home/user_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class DeckTile extends StatelessWidget {
  final DeckModel deck;
  final VoidCallback? onTap;

  const DeckTile({
    super.key,
    required this.deck,
    this.onTap,
  });

  Color get _color {
    final hex = deck.colorHex.replaceAll('#', '');
    return Color(int.parse('FF$hex', radix: 16));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: _color,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Emoji icon circle
            Container(
              width: 18,
              height: 34,
             
              alignment: Alignment.center,
              child:Image.asset(
              deck.imagePath,
              width: 28,
              height: 28,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.image_not_supported, size: 28),
),
            ),

            // Title + count
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  deck.cardCount,
                style: GoogleFonts.jost(
                 fontSize:9,
                 color:AppColors.decktiletextcolor,
                 fontWeight: FontWeight.w400,
                
                        ),
                ),
                const SizedBox(height: 2),
                Text(
                  deck.title,
                  style: GoogleFonts.jost(
                 fontSize:20,
                 color:AppColors.decktiletextcolor,
                 fontWeight: FontWeight.w300,
                
                        ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}