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
  static const Color pinkCard = Color(0xFFBF8C8C);
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
              onTap: (){
                 Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const FocusModeScreen()
          ),
    );
              },
              child: Text(
                'CARD ${provider.currentIndex + 1} OF ${provider.totalCards}',
                style: GoogleFonts.jost(
                       fontSize:10,
                       letterSpacing:1.8,
                       color: Color(0xFF7A6F66),
                       fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          const SizedBox(height: 6),
           Text(
            AppText.swipe,
            style: GoogleFonts.jost(
                     fontSize:16,
                      height: 1.0,                    
                     color: Color(0xFF7A6F66),
                     fontWeight: FontWeight.w400,
  ),
          ),

          // const SizedBox(height:0),

          // ── Card Deck ──
          Expanded(
            child: GestureDetector(
              onTap: provider.flipCard,
              onHorizontalDragEnd: (details) {
                if (details.primaryVelocity! < -200) {
                  provider.nextCard();
                } else if (details.primaryVelocity! > 200) {
                  provider.previousCard();
                }
              },
              child: const DeckView(),
            ),
          ),

          const SizedBox(height: 24),

          // ── Navigation ──
          const NavigationRow(),

          const SizedBox(height: 16),

          // ── Progress ──
          const ProgressBar(),

          const SizedBox(height: 24),
        ],
      ),
    );
  }
}