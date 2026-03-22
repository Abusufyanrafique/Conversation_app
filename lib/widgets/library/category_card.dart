// CATEGORY CARD WIDGET
// ─────────────────────────────────────────
 
import 'package:conversation_app/models/library/deck_category.dart';
import 'package:conversation_app/widgets/library/card_description.dart';
import 'package:conversation_app/widgets/library/card_title_row.dart';
import 'package:conversation_app/widgets/library/deck_count_sidebar.dart';
import 'package:conversation_app/widgets/library/tag_row.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final DeckCategory category;
  final double? opacity; 
 
  const CategoryCard({
    super.key, 
    required this.category, 
    this.opacity
    });
 
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 153,
      width: 326,
      decoration: BoxDecoration(
        color: category.color.withOpacity(opacity ?? 0.8),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color:Colors.white,
        width: 1.02,
        ),
      ),
      child: Row(
        children: [
          DeckCountSidebar(
            deckCount: category.deckCount,
            color: category.color,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 14, 12, 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CardTitleRow(
                    title: category.title,
                    cardCount: category.cardCount,
                    color: category.color,
                  ),
                  const SizedBox(height: 4),
                  CardDescription(description: category.description),
                  const SizedBox(height: 10),
                  TagRow(
                    tags: category.tags,
                    isPremium: category.isPremium,
                    color: category.color,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: Icon(
              Icons.chevron_right,
              color: category.color,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}