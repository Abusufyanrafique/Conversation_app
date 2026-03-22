// DECK COUNT SIDEBAR WIDGET
// ─────────────────────────────────────────
 
import 'package:flutter/material.dart';

class DeckCountSidebar extends StatelessWidget {
  final int deckCount;
  final Color color;
 
  const DeckCountSidebar({
    super.key,
    required this.deckCount,
    required this.color,
  });
 
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 28,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: color.withOpacity(0.18),
        borderRadius: BorderRadius.circular(8),
      ),
      child: RotatedBox(
        quarterTurns: 3,
        child: Text(
          '$deckCount DECKS',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 8,
            letterSpacing: 1.0,
            color: color.withOpacity(0.9),
            fontWeight: FontWeight.w600,
            fontFamily: 'Georgia',
          ),
        ),
      ),
    );
  }
}
 