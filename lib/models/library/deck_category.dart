import 'package:flutter/material.dart';
 
// ─────────────────────────────────────────
// MODELS
// ─────────────────────────────────────────
 
class DeckCategory {
  final String title;
  final int cardCount;
  final String description;
  final Color color;
  final IconData icon;
  final List<String> tags;
  final int deckCount;
  final bool isPremium;
  final String imagepath;
 
  const DeckCategory({
    required this.title,
    required this.cardCount,
    required this.description,
    required this.color,
    required this.icon,
    required this.tags,
    required this.deckCount,
    this.isPremium = false, required this.imagepath,
  });
}