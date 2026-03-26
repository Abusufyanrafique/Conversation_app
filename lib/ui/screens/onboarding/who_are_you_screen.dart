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
    final double sh = MediaQuery.of(context).size.height;

    final double topSpacing    = sh * 0.028;
    final double titleSize     = sh * 0.044;
    final double gap1          = sh * 0.007;  // after label
    final double gap2          = sh * 0.009;  // after title block
    final double gap3          = sh * 0.026;  // after subtitle
    final double gap4          = sh * 0.017;  // between grid and 5th card
    final double gridItemH     = sh * 0.118;
    final double gridItemW     = gridItemH * (144 / 103);
    final double fifthCardH    = sh * 0.150;
    final double bottomSpacing = sh * 0.020;

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
                    SizedBox(height: topSpacing),

                    // Label
                    Text(
                      AppText.yourfirstdeck,
                      style: AppTextStyles.jost(
                        fontSize: 10,
                        color: const Color(0xFF9C9590),
                        letterSpacing: 2.8,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    SizedBox(height: gap1),

                    // Title
                    Text(
                      AppText.whoareyou,
                      style: AppTextStyles.jost(
                        fontSize: titleSize,
                        color: const Color(0xFF2B2622),
                        fontWeight: FontWeight.w300,
                      ),
                    ),

                    // RichText
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: AppText.here,
                            style: AppTextStyles.jost(
                              fontSize: titleSize,
                              color: const Color(0xFF2B2622),
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          TextSpan(
                            text: AppText.for1,
                            style: AppTextStyles.jost(
                              fontSize: titleSize,
                              color: const Color(0xFF9C9590),
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: gap2),

                    // Subtitle
                    Text(
                      AppText.youcanalways,
                      style: AppTextStyles.jost(
                        fontSize: 10,
                        color: const Color(0xFF9C9590),
                        letterSpacing: 2.8,
                        fontWeight: FontWeight.w300,
                      ),
                    ),

                    SizedBox(height: gap3),

                    // 2x2 Grid
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: gridItemW / gridItemH,
                      children: decks
                          .take(4)
                          .map(
                            (deck) => DeckCard(
                              deck: deck,
                              isTappable: false,
                              height: gridItemH,
                            ),
                          )
                          .toList(),
                    ),

                    SizedBox(height: gap4),

                    // 5th card (Full Width)
                    if (decks.isNotEmpty)
                      SizedBox(
                        width: double.infinity,
                        child: DeckCard(
                          deck: decks.last,
                          height: fifthCardH,
                          width: double.infinity,
                        ),
                      ),

                    const Spacer(),

                    // Continue Button
                    Custom_Button_who(
                      text: 'CONTINUE',
                      isActive: provider.hasSelection,
                      onTap: () {
                        if (provider.hasSelection) {
                          // Navigate to next screen
                        }
                      },
                    ),

                    SizedBox(height: bottomSpacing * 0.8),

                    // Skip
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

                    // SizedBox(height: bottomSpacing),
                  ],
                ),
        ),
      ),
    );
  }
}