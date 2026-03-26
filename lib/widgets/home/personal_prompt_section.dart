import 'package:conversation_app/Utils/app_images.dart';
import 'package:conversation_app/Utils/app_text.dart' as AppText;
import 'package:conversation_app/providers/home/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dart:ui';

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
          // SizedBox(height: 5,),
          Row(children: [
            Text(
             AppText.todaypersonal,
              style: GoogleFonts.jost(
                fontSize: 9.2,
                color: const Color(0xFF9E9890),
                letterSpacing: 2.8,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(width: 9),
            Expanded(
              child: Container(
                height: 0.98,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0x2E9E9890),
                      Color(0x009E9890),
                    ],
                  ),
                ),
              ),
            ),
          ]),
          const SizedBox(height: 25),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFEFE7DE),
              borderRadius: BorderRadius.circular(15.27),
              border: Border.all(
                color: Colors.white,
                width: 1.02,
              ),
            ),
            // isPremiumView true  → user ne badge tap kiya → locked card dikhao
            // isPremiumView false → normal free card dikhao (aapka original)
           child: !provider.isPremiumView
          ? const _LockedPrompt()
          : _UnlockedPrompt(text: provider.personalPrompt),
          ),
        ],
      ),
    );
  }
}

// ── Free Plan Card (aapka original _UnlockedPrompt) ─────
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
        Container(
  width: 21.28,
  height: 1.45,
  decoration: const BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color(0xFF9E9890),      // 100% opacity
        Color(0x009E9890),      // 0% opacity
      ],
    ),
  ),
),
        const SizedBox(height: 10),
        Text(
        "Today, notice a moment when you felt genuinely yourself. What made that possible?",
        style: GoogleFonts.cormorantGaramond(
        fontSize: 16,
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.italic,
        color: const Color(0xFF2B2622),
  ),
        ),
        const SizedBox(height: 10),
        Text(
          AppText.unlockwithpremium,
          style: GoogleFonts.jost(
          fontSize: 8.91,
          fontWeight: FontWeight.w400,
          color: const Color(0xFF9E9890),
                        ),
        ),
      ],
    );
  }
}

// ── Premium Badge Tap → Locked Card ─────────────────────
class _LockedPrompt extends StatelessWidget {
  const _LockedPrompt();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         
          const _PersonalLabel(),
            const SizedBox(height: 10),
            Container(
            width: 21.28,
            height: 1.45,
            decoration: const BoxDecoration(
            gradient: LinearGradient(
            colors: [
            Color(0xFF9E9890),      // 100% opacity
            Color(0x009E9890),      // 0% opacity
      ],
    ),
  ),
),
          const SizedBox(height: 10),
          // gradient line
          Container(
            width: 21.29,
            height: 1.5,
            decoration: BoxDecoration(
              color: Color(0xFFF4EFEA).withOpacity(0.01),
            ),
          ),
          const SizedBox(height: 10),

          // Blurred text + PREMIUM FEATURE button
          Stack(
            alignment: Alignment.center,
            children: [
              // Blurred text layer
              ImageFiltered(
                imageFilter: ImageFilter.blur(
                  sigmaX: 4.5, 
                  sigmaY: 4.5
                  ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '"Today, notice a moment when you felt genuinely yourself. What made that possible?"',
                      maxLines: 3,
                      style: GoogleFonts.jost(
                        fontSize: 14.3,
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic,
                        color: const Color(0xFF2B2622),
                      ),
                    ),
                    const SizedBox(height: 13),
                     Text(
                       AppText.unlockwithpremium,
                      style: GoogleFonts.jost(
                          fontSize: 8.9,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF9E9890),
                        ),
                    ),
                  ],
                ),
              ),

              // PREMIUM FEATURE button (center overlay)
              GestureDetector(
                onTap: () {
                  // TODO: Navigator.push(context, MaterialPageRoute(builder: (_) => PremiumScreen()));
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF4EFEA).withOpacity(0.01),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color:  Colors.white.withOpacity(0.50),
                      width: 0.98,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.07),
                        blurRadius: 14,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image(image: AssetImage(
                      AppImages.lockimage)),
                      const SizedBox(width: 7),
                      Text(
                       AppText.featuretext,
                        style: GoogleFonts.jost(
                          fontSize: 10.17,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.22,
                          color: const Color(0xFF64605B),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
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
         Image(image: const AssetImage(            
         AppImages.guestdotimage)),
          const SizedBox(width: 8),
          Text(
            AppText.personalprompt,
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