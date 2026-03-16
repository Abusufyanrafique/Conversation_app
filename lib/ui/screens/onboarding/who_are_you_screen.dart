import 'package:conversation_app/Utils/app_text.dart' as AppText;
import 'package:conversation_app/Utils/app_textstyles.dart';
import 'package:conversation_app/providers/OnboardingProvider/deck_provider.dart';
import 'package:conversation_app/widgets/onboarding_widget/Custom_button_who_are_you.dart';
import 'package:conversation_app/widgets/onboarding_widget/deck_cardwidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WhoAreYouScreen extends StatelessWidget {
  const WhoAreYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DeckProvider>();
    final decks = provider.decks;

    return Scaffold(
      backgroundColor: const Color(0xFFEFE7DE),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: decks.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),

                    /// Label
                    Text(
                      AppText.yourfirstdeck,
                      style: AppTextStyles.jost(
                        fontSize: 10,
                        color: const Color(0xFF9C9590),
                        letterSpacing: 2.8,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 6),

                    /// Title
                    Text(
                      AppText.whoareyou,
                      style: AppTextStyles.jost(
                        fontSize: 38,
                        color: const Color(0xFF2B2622),
                        fontWeight: FontWeight.w300,
                      ),
                    ),

                    /// RichText
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: AppText.here,
                            style: AppTextStyles.jost(
                              fontSize: 38,
                              color: const Color(0xFF2B2622),
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          TextSpan(
                            text: AppText.for1,
                            style: AppTextStyles.jost(
                              fontSize: 38,
                              color: const Color(0xFF9C9590),
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 8),

                    /// Subtitle
                    Text(
                      AppText.youcanalways,
                      style: AppTextStyles.jost(
                        fontSize: 10,
                        color: const Color(0xFF9C9590),
                        letterSpacing: 2.8,
                        fontWeight: FontWeight.w300,
                      ),
                    ),

                    const SizedBox(height: 28),

                    /// 2x2 Grid
                   GridView.count(
  crossAxisCount: 2,
  shrinkWrap: true,
  physics: const NeverScrollableScrollPhysics(),
  crossAxisSpacing: 12,
  mainAxisSpacing: 12,
  childAspectRatio: 144 / 103, // width / height
  children: decks
      .take(4)
      .map(
        (deck) => SizedBox(
          height: 103,
          width: 144,
          child: DeckCard(
            deck: deck,
            isTappable: false, height: 0,
          ),
        ),
      )
      .toList(),
),

                    const SizedBox(height: 12),

                    /// 5th card (Full Width)
                    if (decks.isNotEmpty)
                      SizedBox(
                        width: double.infinity,
                        child: DeckCard(
                          deck: decks.last,
                          height: 107,
                          width: 144,
                        ),
                      ),

                    const Spacer(),

                    /// Continue Button
                    Custom_Button_who(
                      text: 'CONTINUE',
                      isActive: provider.hasSelection,
                      onTap: () {
                        if (provider.hasSelection) {
                          // Navigate to next screen
                        }
                      },
                    ),

                    const SizedBox(height: 16),

                    /// Skip
                    Center(
                      child: Text(
                        AppText.skipfornow,
                        style: AppTextStyles.jost(
                          fontSize: 10,
                          color: const Color(0xFF9C9590),
                          letterSpacing: 2.8,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),
                  ],
                ),
        ),
      ),
    );
  }
}