import 'package:conversation_app/Utils/app_colors.dart';
import 'package:conversation_app/models/home/user_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui';

class DeckTile extends StatelessWidget {
  final DeckModel deck;
  final VoidCallback? onTap;
  final bool isPremiumView;
  final int index;

  const DeckTile({
    super.key,
    required this.deck,
    required this.index,
    required this.isPremiumView,
    this.onTap,
  });

  bool get _isLocked => !isPremiumView && index >= 2;

  @override
  Widget build(BuildContext context) {
    Color color = Color(
      int.parse(deck.colorHex.replaceFirst('#', '0xFF')),
    ).withOpacity(0.8);

    final Widget cardBody = Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.white,
          width: 1.02,
        ),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 18,
            height: 34,
            alignment: Alignment.center,
            child: Image.asset(
              deck.imagePath,
              width: 28,
              height: 28,
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) =>
                  const Icon(Icons.image_not_supported, size: 28),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                deck.cardCount,
                style: GoogleFonts.jost(
                  fontSize: 9,
                  color: AppColors.decktiletextcolor.withOpacity(0.46),
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                deck.title,
                style: GoogleFonts.jost(
                  fontSize: 20,
                  color: AppColors.decktiletextcolor,
                  fontWeight: FontWeight.w300,
                ),
              ),
              // ── Sirf first 2 cards par line — title ke baad ──
            if (index < 2) ...[
                const SizedBox(height: 4),
             Container(
             height: 1.92,
             decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(10),
             gradient: LinearGradient(
    colors: [
        Colors.white.withOpacity(0.0),
        Colors.white.withOpacity(0.85),
        Colors.white.withOpacity(0.85),
        Colors.white.withOpacity(0.25),
        Colors.white.withOpacity(0.25),
        Colors.white.withOpacity(0.0),
      ],
      stops: const [0.0, 0.02, 0.40, 0.46, 0.98, 1.0],
    ),
  ),
),      ],
            ],
          ),
        ],
      ),
    );

    return GestureDetector(
      onTap: _isLocked ? null : onTap,
      child: Stack(
        fit: StackFit.expand,
        children: [
          if (_isLocked)
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(
                  sigmaX: 3.5,
                  sigmaY: 3.5,
                  tileMode: TileMode.decal,
                ),
                child: cardBody,
              ),
            )
          else
            cardBody,

          if (_isLocked)
            Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.10),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 33,
                    height: 33,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.22),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.55),
                        width: 1,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Image.asset(
                      "assets/icons/authentication/lock.png",
                      width: 16,
                      height: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.20),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.50),
                        width: 0.98,
                      ),
                    ),
                    child: Text(
                      '\$4.99',
                      style: GoogleFonts.jost(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}