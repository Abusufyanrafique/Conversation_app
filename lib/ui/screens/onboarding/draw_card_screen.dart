import 'package:conversation_app/Utils/app_colors.dart';
import 'package:conversation_app/Utils/app_text.dart' as AppText;
import 'package:conversation_app/Utils/app_textstyles.dart';
import 'package:conversation_app/providers/OnboardingProvider/card_provider.dart';
import 'package:conversation_app/widgets/onboarding_widget/custom_button.dart';
import 'package:conversation_app/widgets/onboarding_widget/flip_cardwidget.dart';
import 'package:conversation_app/widgets/onboarding_widget/tap_labelwidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class Draw_Card_Screen extends StatelessWidget {
  const Draw_Card_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CardProvider(),
      child: const _DrawCardView(),
    );
  }
}

class _DrawCardView extends StatelessWidget {
  const _DrawCardView();

  Widget _buildStep({
    required String number,
    required String boldText,
    required String normalText,
    required double fontSize,
    required double circleSize,
    required double iconFontSize,
    required double spacing,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Number Container ──
        Container(
          height: circleSize,
          width: circleSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFFA8B5A2).withOpacity(0.18),
            border: Border.all(
              color: const Color(0xFFFFFFFF).withOpacity(0.28),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFA8B5A2).withOpacity(0.18),
                offset: const Offset(0, 2),
                blurRadius: 8,
                spreadRadius: 0,
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Text(
            number,
            style: AppTextStyles.jost(
              fontSize: iconFontSize,
              color: const Color(0xFF5C5651),
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(width: spacing),

        // ── Text ──
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: boldText,
                  style: AppTextStyles.jost(
                    fontSize: fontSize,
                    color: const Color(0xFF1C1B1A),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: normalText,
                  style: AppTextStyles.jost(
                    fontSize: fontSize,
                    color: const Color(0xFF5C5651),
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final screenHeight = constraints.maxHeight;
        final isSmall = screenWidth < 360;
        final isLarge = screenWidth >= 600;
        final isTablet = screenWidth >= 768;

        // ── Responsive Values ──
        final double hPadding = isTablet
            ? screenWidth * 0.12
            : isLarge
                ? screenWidth * 0.08
                : 20.0;

        final double topSpacing = isSmall ? 16 : 26;
        final double titleFontSize = isTablet
            ? 52
            : isLarge
                ? 44
                : isSmall
                    ? 28
                    : 38;
        final double labelFontSize = isTablet
            ? 20
            : isLarge
                ? 18
                : isSmall
                    ? 13
                    : 16;
        final double stepFontSize = isTablet
            ? 18
            : isLarge
                ? 17
                : isSmall
                    ? 13
                    : 15;
        final double circleSize = isTablet
            ? 32
            : isLarge
                ? 28
                : isSmall
                    ? 20
                    : 24;
        final double iconFontSize = isTablet
            ? 13
            : isLarge
                ? 11
                : isSmall
                    ? 9
                    : 10;
        final double stepSpacingText = isTablet ? 16 : 12;
        final double stepRowSpacing = isSmall
            ? 12
            : isTablet
                ? 22
                : 16;
        final double cardBottomSpacing = isSmall ? 10 : 16;
        final double sectionSpacing = isSmall ? 16 : 28;
        final double titleToCardSpacing = isSmall ? 16 : 28;

        return Scaffold(
          backgroundColor: AppColors.backgroundscreencolor,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: hPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: topSpacing),

                  // ── How It Works Label ──
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      AppText.howworks,
                      style: AppTextStyles.jost(
                        color: const Color(0xFF7A6F66),
                        fontSize: labelFontSize,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // ── Title Section ──
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppText.drawcard,
                          style: AppTextStyles.jost(
                            color: const Color(0xFF2B2622),
                            fontSize: titleFontSize,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          AppText.letitland,
                          style: AppTextStyles.jost(
                            color: const Color(0xFF7A6F66),
                            fontSize: titleFontSize,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: titleToCardSpacing),

                  // ── Scrollable Body ──
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          // ── Flip Card — constrained width on large screens ──
                         
                          Center(
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth: isTablet ? 320 : double.infinity,
                              ),
                              child: const FlipCard(),
                            ),
                          ),

                          SizedBox(height: cardBottomSpacing),

                          const TapLabelWidget(),

                          SizedBox(height: sectionSpacing),

                          // ── Steps List ──
                          Column(
                            children: [
                              _buildStep(
                                number: '1',
                                boldText: AppText.chooseadeck,
                                normalText: AppText.forrelation,
                                fontSize: stepFontSize,
                                circleSize: circleSize,
                                iconFontSize: iconFontSize,
                                spacing: stepSpacingText,
                              ),
                              SizedBox(height: stepRowSpacing),
                              _buildStep(
                                number: '2',
                                boldText: AppText.drawacard,
                                normalText: AppText.flip,
                                fontSize: stepFontSize,
                                circleSize: circleSize,
                                iconFontSize: iconFontSize,
                                spacing: stepSpacingText,
                              ),
                              SizedBox(height: stepRowSpacing),
                              _buildStep(
                                number: '3',
                                boldText: AppText.talk,
                                normalText: AppText.savethe,
                                fontSize: stepFontSize,
                                circleSize: circleSize,
                                iconFontSize: iconFontSize,
                                spacing: stepSpacingText,
                              ),
                            ],
                          ),

                          SizedBox(height: sectionSpacing),
                        ],
                      ),
                    ),
                  ),

                  // ── Bottom Button ──
                  Center(
                    child: CustomButton(
                      useGradient: false,
                      backgroundColor: const Color(0xFF2B2622),
                      onTap: () {},
                      text: 'CONTINUE',
                      textColor: Colors.white,
                    ),
                  ),

                  SizedBox(height: isSmall ? 12 : 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}