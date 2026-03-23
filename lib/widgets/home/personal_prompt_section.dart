import 'package:conversation_app/providers/home/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../utils/app_colors.dart';

class PersonalPromptSection extends StatelessWidget {
  const PersonalPromptSection({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
             Text(
            'TODAY\'S PERSONAL PROMPT',
            style: GoogleFonts.jost(
                 fontSize:9.2,
                 color:Color(0xFF9E9890),
                 letterSpacing: 2.8,
                 fontWeight: FontWeight.w400,
                
                        ),
          ),
          SizedBox(width: 9,),
           Expanded(
            child: Container(
              height: 0.98,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0x2E9E9890), // #9E98902E - 18% opacity
                    Color(0x009E9890), // #9E989000 - 0% opacity
                  ],
                ),
              ),
            ),
          ),
          ],),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color:Color(0xFFEFE7DE),
              borderRadius: BorderRadius.circular(15.27),
              border: Border.all(
                color:Colors.white,
                width: 1.02,
                ),
            ),
            child: provider.promptUnlocked
                ? _UnlockedPrompt(text: provider.personalPrompt)
                : const _LockedPrompt(),
          ),
        ],
      ),
    );
  }
}

// ── Unlocked ────────────────────────────────────────────
class _UnlockedPrompt extends StatelessWidget {
  final String text;
  const _UnlockedPrompt({required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _PersonalLabel(),
        const SizedBox(height: 10),
        Text(
          "Today, notice a moment when you felt genuinely yourself. What made that possible?",
          style:  TextStyle(
            fontSize: 14,
            color:Color(0xFF2B2622),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Unlock with premium',
          style: TextStyle(
            fontSize: 9.8,
            color:Color(0xFF9E9890),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

// ── Locked ──────────────────────────────────────────────
class _LockedPrompt extends StatelessWidget {
  const _LockedPrompt();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _PersonalLabel(),
        const SizedBox(height: 10),

        // Blurred placeholder lines
        _BlurLine(width: double.infinity),
        const SizedBox(height: 6),
        _BlurLine(width: 200),
        const SizedBox(height: 6),
        _BlurLine(width: 140),

        const SizedBox(height: 10),
        GestureDetector(
          onTap: () => context.read<HomeProvider>().unlockPrompt(),
          child: const Text(
            'Unlock with premium',
            style: TextStyle(
            fontSize: 9.8,
            color:Color(0xFF9E9890),
            fontWeight: FontWeight.w400,
          ),
          ),
        ),
      ],
    );
  }
}

class _BlurLine extends StatelessWidget {
  final double width;
  const _BlurLine({required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 10,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

class _PersonalLabel extends StatelessWidget {
  const _PersonalLabel();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Icon(Icons.stars_rounded, size: 12, color: AppColors.premiumGold),
        const SizedBox(width: 4),
        const Text(
          'PERSONAL PROMPT',
          style: TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.w700,
            // color: AppColors.textLight,
            letterSpacing: 0.8,
          ),
        ),
      ],
    );
  }
}

const AppColors_premiumGold = Color(0xFFB8955A);
extension on AppColors {
  static const premiumGold = Color(0xFFB8955A);
}