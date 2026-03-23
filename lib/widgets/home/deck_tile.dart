import 'package:conversation_app/models/home/user_model.dart';
import 'package:flutter/material.dart';


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
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.25),
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Text(deck.emoji, style: const TextStyle(fontSize: 16)),
            ),

            // Title + count
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  deck.cardCount,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white.withOpacity(0.75),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  deck.title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
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