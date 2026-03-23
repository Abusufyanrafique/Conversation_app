import 'package:conversation_app/Utils/app_colors.dart';
import 'package:conversation_app/providers/home/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SavedMomentsSection extends StatelessWidget {
  const SavedMomentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final moments = context.watch<HomeProvider>().savedMoments;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'SAVED MOMENTS',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              // color: AppColors.textLight,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 120,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: moments.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                return _MomentCard(quote: moments[index].quote);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _MomentCard extends StatelessWidget {
  final String quote;
  const _MomentCard({required this.quote});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.6;

    return Container(
      width: width,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.divider),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            quote,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12,
              // color: AppColors.textMedium,
              fontFamily: 'Playfair Display',
              height: 1.45,
              fontStyle: FontStyle.italic,
            ),
          ),
          // const Icon(Icons.favorite, size: 14, color: AppColors.cardBrown),
        ],
      ),
    );
  }
}