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

  // ── Helper Method — Sahi jagah ──
  Widget _buildStep({
    required String number,
    required String boldText,
    required String normalText,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Number Container ──
       Container(
  height: 24,
  width: 24,
  decoration: BoxDecoration(
    shape: BoxShape.circle,
    color: const Color(0xFFA8B5A2).withOpacity(0.18), // ── Background color
    
    
    border: Border.all(
      color: const Color(0xFFFFFFFF).withOpacity(0.28), // ── Border
      width: 1,
    ),
    boxShadow: [
      BoxShadow(
        color: const Color(0xFFA8B5A2).withOpacity(0.18), // ── Shadow
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
      fontSize: 10,
      color: const Color(0xFF5C5651),
      fontWeight: FontWeight.w400,
    ),
  ),
),
        const SizedBox(width: 12),

        // ── Text ──
        Expanded(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: boldText,
                  style: AppTextStyles.jost(
                    fontSize: 17,
                    color: const Color(0xFF1C1B1A),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: normalText,
                  style: AppTextStyles.jost(
                    fontSize: 17,
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
    return Scaffold(
      backgroundColor:AppColors.backgroundscreencolor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 26),

              const _HowItWorksLabel(),

              const SizedBox(height: 10),

              const _TitleSection(),

              const SizedBox(height: 28),

              // ── Card + Steps Section ──
              Expanded(
                child: Column(
                  children: [
                    const Center(
                      child: FlipCard(),
                    ),

                    const SizedBox(height: 16),

                    const TapLabelWidget(),

                    const SizedBox(height: 28),

                    // ── Steps List ──
                    Column(
                      children: [
                        _buildStep(
                          number: '1',
                          boldText: AppText.chooseadeck,
                          normalText: AppText.forrelation,
                        ),
                        const SizedBox(height: 16),
                        _buildStep(
                          number: '2',
                          boldText: AppText.drawacard,
                          normalText: AppText.flip,
                        ),
                        const SizedBox(height: 16),
                        _buildStep(
                          number: '3',
                          boldText: AppText.talk,
                          normalText: AppText.savethe,
                        ),
                      ],
                    ),

                    const Spacer(),
                  ],
                ),
              ),

              // ── Bottom Button ──
             CustomButton(
             useGradient: false,
             backgroundColor: const Color(0xFF2B2622),
             onTap: () {},
             text: 'CONTINUE',
             textColor: Colors.white,
),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _HowItWorksLabel extends StatelessWidget {
  const _HowItWorksLabel();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Text(
        AppText.howworks,
        style: AppTextStyles.jost(
          color: const Color(0xFF7A6F66),
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

class _TitleSection extends StatelessWidget {
  const _TitleSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppText.drawcard,
            style: AppTextStyles.jost(
              color: const Color(0xFF2B2622),
              fontSize: 38,
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(
            AppText.letitland,
            style: AppTextStyles.jost(
              color: const Color(0xFF7A6F66),
              fontSize: 38,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}