import 'package:conversation_app/Utils/app_text.dart' as AppText;
import 'package:conversation_app/providers/Card_Interation/Cardprovider.dart';
import 'package:conversation_app/ui/screens/pay_wall/welcome_screen.dart';
import 'package:conversation_app/widgets/card_interaction/bottom_nav_widget_focus_screen.dart';
import 'package:conversation_app/widgets/card_interaction/flip_foucs_screen_card_widget.dart';
import 'package:conversation_app/widgets/card_interaction/page_foucs_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class FocusModeScreen extends StatelessWidget {
  const FocusModeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CardFocusScreenProvider>();

    return Scaffold(
      backgroundColor: const Color(0xFF2B2622),
      body: SafeArea(
        child: GestureDetector(
          onTap: (){
            Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const WelcomeScreen()
          ),
    );
          },
              child: Column(
              children: [
              Expanded(
                child: PageView.builder(
                  controller: provider.pageController,
                  itemCount: provider.totalCards,
                  onPageChanged: provider.onPageChanged,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal:60,
                        vertical: 160,
                      ),
                      child: SizedBox(
                        height: 200,
                        child: FlipFoucsScreenCardWidget(
                          card: provider.cards[index],
                          isFlipped: provider.isFlipped(index),
                          onFlip: () => provider.flipCard(index),
                        ),
                      ),
                    );
                  },
                ),
              ),
          
              // Page indicator + tap hint
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Column(
                  children: [
                    PageFocusIndicatorWidget(
                      totalPages: provider.totalCards,
                      currentIndex: provider.currentIndex,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      AppText.taptoadvance,
                    style: GoogleFonts.jost(
                       fontSize:10,
                       letterSpacing: 2.16,
                       color: Color(0xFF9C9590),
                       fontWeight: FontWeight.w400,
            ),
                    ),
                  ],
                ),
              ),
             
              // Bottom navigation
              const BottomNavWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

