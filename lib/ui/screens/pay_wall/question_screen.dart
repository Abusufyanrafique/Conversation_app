import 'package:conversation_app/Utils/app_images.dart';
import 'package:conversation_app/providers/Paywall/question_screen_provider.dart';
import 'package:conversation_app/widgets/pay_wall/question_dot_indicator.dart';
import 'package:conversation_app/widgets/pay_wall/question_screen_bottom_nav.dart';
import 'package:conversation_app/widgets/pay_wall/question_screen_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QuestionScreenProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFFEFE7DE),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),

            // Top Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 34.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Back Button
                  Container(
                    height: 37.87,
                    width: 37.87,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.white, width: 1),
                    ),
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Image(
                        image: AssetImage(AppImages.foucsarrow),
                      ),
                    ),
                  ),

                  // Card Counter
                  Text(
                    "CARD ${provider.currentIndex + 1} OF ${provider.totalCards}",
                    style: GoogleFonts.jost(
                      fontSize: 10,
                      color: const Color(0xFFA09890),
                      letterSpacing: 1.8,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  // Dot Indicator
                  QuestionDotIndicator(
                    currentIndex: provider.currentIndex,
                    total: provider.cards.length,
                  ),
                ],
              ),
            ),

            const Spacer(),

            //  PageView for swipeable cards
            SizedBox(
              height: 261,
              width: 350,
              child: PageView.builder(
                controller: provider.pageController,
                onPageChanged: provider.onPageChanged,
                itemCount: provider.cards.length,
                itemBuilder: (context, index) {
                  return QuestionScreenCard(card: provider.cards[index]);
                },
              ),
            ),

            const Spacer(),

            // Bottom Navigation
            QuestionScreenbottomNav(),
          ],
        ),
      ),
    );
  }
}