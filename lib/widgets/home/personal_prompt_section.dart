import 'package:conversation_app/Utils/app_images.dart';
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
              color:Color(0xFFF4EFEA).withOpacity(0.01),
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0,),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _PersonalLabel(),
           const SizedBox(height: 10),
          //  ================ line container====================home screen======+++++++++++ 
              Container(
              width: 21.29,
              height: 1.5,
              decoration: BoxDecoration(
              gradient: LinearGradient(
        colors: [
          const Color(0xFF9E9B90).withOpacity(0.35),
          const Color(0xFF9E9B90).withOpacity(0.0),
        ],
      ),
        ),
      ),
          const SizedBox(height: 10),
      
          // Blurred placeholder lines
          _BlurLine(
            text: "Today, notice a moment when you felt genuinely yourself. What made that possible?",
          ),
          
      
          const SizedBox(height: 13.87),
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
      ),
    );
  }
}

class _BlurLine extends StatelessWidget {
  final String text;
  const _BlurLine({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.jost(
        fontSize: 14.3,
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.italic,
        color: const Color(0xFF2B2622),
      ),
    );
  }
}
class _PersonalLabel extends StatelessWidget {
  const _PersonalLabel();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        children: [
          // SizedBox(height: 23.21,),
          Image(image: AssetImage(AppImages.guestdotimage)),
          const SizedBox(width: 8),
           Text(
            'PERSONAL PROMPT',
            style: GoogleFonts.jost(
          fontSize: 8.9,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.47,
          color: const Color(0xFF9E9890),
        ),
          ),
        ],
      ),
    );
  }
}

const AppColors_premiumGold = Color(0xFFB8955A);
extension on AppColors {
  static const premiumGold = Color(0xFFB8955A);
}