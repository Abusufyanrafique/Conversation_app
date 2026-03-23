import 'package:flutter/material.dart';


class UnlockBanner extends StatelessWidget {
  const UnlockBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          // color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          // border: Border.all(color: AppColors.divider),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heart icon
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                // color: AppColors.cardBrown.withOpacity(0.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.favorite,
                // color: AppColors.cardBrown,
                size: 18,
              ),
            ),
            const SizedBox(height: 12),

            // Title
            RichText(
              text: const TextSpan(
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  // color: AppColors.textDark,
                ),
                children: [
                  TextSpan(text: 'There\'s '),
                  TextSpan(
                    text: 'more ',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Playfair Display',
                    ),
                  ),
                  TextSpan(text: 'waiting.'),
                ],
              ),
            ),
            const SizedBox(height: 8),

            // Description
            const Text(
              'Ten more decks, personalized daily prompts, and the ability to save the questions that hit home — all yours.',
              style: TextStyle(
                fontSize: 12,
                // color: AppColors.textMedium,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 8),

            // Feature bullets
            _FeatureBullet(text: '10 more decks  •  Daily prompts'),
            const SizedBox(height: 4),
            _FeatureBullet(text: 'Save Favourites'),
            const SizedBox(height: 14),

            // Disclaimer
            const Text(
              'Some conversations only happen when you make space for them.',
              style: TextStyle(
                fontSize: 11,
                // color: AppColors.textLight,
                fontStyle: FontStyle.italic,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 14),

            // Unlock button
            SizedBox(
              width: double.infinity,
              height: 44,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  // backgroundColor: AppColors.drawBtn,
                  // foregroundColor: AppColors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'UNLOCK →',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FeatureBullet extends StatelessWidget {
  final String text;
  const _FeatureBullet({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 14,
          height: 14,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            // color: AppColors.divider,
          ),
          // child: const Icon(Icons.check, size: 8, color: AppColors.textMedium),
        ),
        const SizedBox(width: 6),
        Text(
          text,
          style: const TextStyle(
            fontSize: 11,
            // color: AppColors.textMedium,
          ),
        ),
      ],
    );
  }
}