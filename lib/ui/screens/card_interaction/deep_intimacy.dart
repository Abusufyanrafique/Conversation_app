import 'package:conversation_app/Utils/app_images.dart';
import 'package:conversation_app/Utils/app_text.dart' as AppText;
import 'package:conversation_app/Utils/app_text.dart' as APPText;
import 'package:conversation_app/ui/screens/card_interaction/card_deck_screen.dart';
import 'package:conversation_app/widgets/card_interaction/begin_button.dart';
import 'package:conversation_app/widgets/card_interaction/container_card.dart';
import 'package:conversation_app/widgets/card_interaction/deck_info_badge.dart';
import 'package:conversation_app/widgets/card_interaction/stat_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeepIntimacy extends StatelessWidget {
  const DeepIntimacy({super.key});

  // Color palette
  static const Color bgOuter = Color(0xFFEFE7DE);
  static const Color bgInner = Color(0xFFFAF6F3);
  static const Color cardDark = Color(0xFFC9877A);
  static const Color cardMid = Color(0xFFD4A89A);
  static const Color cardLight = Color(0xFFDDBDAF);
  static const Color textDark = Color(0xFF2A1C1A);
  static const Color textMuted = Color(0xFF9A7A75);
  static const Color tagBg = Color(0xFFEFE7DE);
  static const Color tagDot = Color(0xFFC9877A);
  static const Color tagText = Color(0xFF9C9590);
  static const Color borderColor = Color(0xFFE8DDD9);
  static const Color btnBg = Color(0xFF1E1410);
  static const Color btnText = Color(0xFFFAF6F3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgOuter,
      body: SafeArea(
        child: Column(
          children: [
            // ─── Card Stack Section ────────────────────────────────────── 
            const SizedBox(height: 40),
         Stack(
         alignment: Alignment.center,
         children: [
    // Card 4 — sabse peeche
    ContainerCard(
      width: 185,
      height: 220,
      angle: -22,
      x: -20,
      y: 8,
      color: const Color(0xFFE2D1CC),
      shadowColor: const Color(0xFFEFE4DF),
    ),

    // Card 3 — right side
    ContainerCard(
      width: 180,
      height: 220,
      angle: -10,
      x: -12,
      y: -6,
      color: const Color(0xFFCBA99E),
    ),

    // Card 2 — halka left
    ContainerCard(
      width: 180,
      height: 220,
      angle: -15,
      x: -10,
      y: -6,
      color: const Color(0xFFD1B0AA), 
    ),

    // Card 1 — sabse aage
    ContainerCard(
      width: 180,
      height: 220,
      angle: -3,
      x: -1,
      y: -17,
      gradientColors:  [
        Color(0xFFD4ADA7).withOpacity(0.90),
        Color(0xFFBF9088).withOpacity(0.96)
      ],
      child: Center(
        child: Image(image:AssetImage(AppImages.finallogo)),
      ),
    ),
  ],
),          const SizedBox(height: 24.38),

            // ─── Bottom Panel ─────────────────────────────────────────────
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                ),
                padding: const EdgeInsets.fromLTRB(28, 28, 28, 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Tag badge
                    const DeckInfoBadge(
                      label: 'INTIMACY · 52 CARDS',
                      dotColor: tagDot,
                      bgColor: tagBg,
                      textColor: tagText,
                    ),

                    const SizedBox(height: 26),

                    // Title: "Deep Intimacy"
                    RichText(
                      text:  TextSpan(
                        children: [
                          TextSpan(
                            text:AppText.deep,
                             style: GoogleFonts.jost(
                            fontSize:42,
                           color: Color(0xFF1C1B1A),
                           fontWeight: FontWeight.w300,
  ),
                          ),
                          TextSpan(
                            text: AppText.intimacy,
                             style: GoogleFonts.jost(
                              fontSize:42,
                              color: Color(0xFF7A6F66),
                              fontWeight: FontWeight.w300,
  ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Subtitle
                     Text(
                      AppText.questionsforpartner,
                     style: GoogleFonts.jost(
                     fontSize:14.44,
                     
                     color: Color(0xFF5C5651),
                     fontWeight: FontWeight.w300,
  ),
                    ),

                    const SizedBox(height: 20.64),

                    // Stat cards row
                    Row(
                      children: const [
                        Expanded(
                          child: 
                          StatCard(
                            count: 52, 
                            label: APPText.card,
                            )),
                        SizedBox(width: 10),
                        Expanded(
                          child: StatCard(
                            count: 52, 
                            label: AppText.card,
                            )),
                        SizedBox(width: 10),
                        Expanded(
                          child: StatCard(
                            count: 52, 
                            label: AppText.card,
                            )),
                      ],
                    ),

                    const Spacer(),
                    // Begin Session Button
                    BeginButton(
                      onTap: () { 
                         Navigator.push(
                         context,
                         MaterialPageRoute(
                          builder: (context) => const CardDeckScreen()
                          ),
    );
                       },
                      )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

