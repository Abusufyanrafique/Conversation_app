import 'package:conversation_app/Utils/app_text.dart' as AppText;
import 'package:conversation_app/providers/Card_Interation/card_provider.dart';
import 'package:conversation_app/ui/screens/card_interaction/foucs_mode_screen.dart';
import 'package:conversation_app/widgets/card_interaction/deck_view.dart';
import 'package:conversation_app/widgets/card_interaction/focus_mode_view.dart';
import 'package:conversation_app/widgets/card_interaction/navigation_row.dart';
import 'package:conversation_app/widgets/card_interaction/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CardDeckScreen extends StatelessWidget {
  const CardDeckScreen({super.key});

  static const Color bgColor = Color(0xFFEFE7DE);
  static const Color pinkCard = Color(0xFFC49790);
  static const Color darkText = Color(0xFF4A3535);
  static const Color subtleText = Color(0xFF9E7C7C);

  @override
  Widget build(BuildContext context) {
    return Consumer<CardProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          backgroundColor: bgColor,
          body: SafeArea(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 350),
              transitionBuilder: (child, animation) => FadeTransition(
                opacity: animation,
                child: child,
              ),
              child: provider.isFocusMode
                  ? const FocusModeView(key: ValueKey('focus'))
                  : const _DeckMainView(key: ValueKey('deck')),
            ),
          ),
        );
      },
    );
  }
}

class _DeckMainView extends StatelessWidget {
  const _DeckMainView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CardProvider>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 26),

          // ── Header ──
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FocusModeScreen(),
                  ),
                );
              },
              child: Text(
                'CARD ${provider.currentIndex + 1} OF ${provider.totalCards}',
                style: GoogleFonts.jost(
                  fontSize: 10,
                  letterSpacing: 1.8,
                  color: const Color(0xFF7A6F66),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),

          const SizedBox(height: 6),

          Text(
            AppText.swipe,
            style: GoogleFonts.jost(
              fontSize: 16,
              height: 1.0,
              color: const Color(0xFF7A6F66),
              fontWeight: FontWeight.w400,
            ),
          ),

          // ── Card Deck ──
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: provider.flipCard,
              onHorizontalDragEnd: (details) {
                if (details.primaryVelocity! < -200) {
                  provider.nextCard();
                } else if (details.primaryVelocity! > 200) {
                  provider.previousCard();
                }
              },
              child: AbsorbPointer(
                child: DeckView(),
              ),
            ),
          ),

          const SizedBox(height: 24),

          // ── Navigation ──
          if (provider.isLastCard) ...[
            // Focus Mode Button
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FocusModeScreen(),
                  ),
                );
              },
              child: Container(
                width: 182,
                height: 42,
                decoration: BoxDecoration(
                  color: const Color(0xFF2C2420),
                  borderRadius: BorderRadius.circular(15.27),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 6.82,
                      height: 6.82,
                      decoration: const BoxDecoration(
                        color: Color(0xFF7A6F66),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'ENTER FOCUS MODE',
                      style: GoogleFonts.jost(
                        fontSize: 11,
                        letterSpacing: 1.32,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFFEFE7DE),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ] else ...[
            // Normal Navigation Row
            const NavigationRow(),
          ],

          const SizedBox(height: 16),

          // ── Progress Bar (sirf last card par hide) ──
          if (!provider.isLastCard) const ProgressBar(),
          if (!provider.isLastCard) const SizedBox(height: 16),

          // ── Left / Right Arrows (SIRF last card par show honge) ──
          if (provider.isLastCard) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // SizedBox(height: 10,),
                // Left Arrow → previous card
                GestureDetector(
                  onTap: () => provider.previousCard(),
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage(
                              "assets/images/card_interation/backarrow.png")),
                        const SizedBox(height: 5),
                        Text(
                          "Back",
                          style: GoogleFonts.jost(
                            fontSize: 9.5,
                            color: const Color(0xFF9C9590),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Right Arrow → reset cards
                GestureDetector(
                  onTap: () => provider.resetCards(),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage(
                              "assets/images/card_interation/focusarrow.png")),
                        const SizedBox(height: 5),
                        Text(
                          "Focus",
                          style: GoogleFonts.jost(
                            fontSize: 9.5,
                            color: const Color(0xFF9C9590),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
          ] else ...[
            const SizedBox(height: 24),
          ],
        ],
      ),
    );
  }
}