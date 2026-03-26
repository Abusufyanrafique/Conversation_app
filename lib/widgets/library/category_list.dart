import 'package:conversation_app/providers/library/library_provider.dart';
import 'package:conversation_app/widgets/library/category_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = context.watch<LibraryProvider>().categories;
    final opacities = [0.8];

    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: categories.length,
      separatorBuilder: (_, __) => const SizedBox(height: 27.87),
      itemBuilder: (context, index) {
        return CategoryCard(
          category: categories[index],
          opacity: opacities[index % opacities.length],
        );
      },
    );
  }
}