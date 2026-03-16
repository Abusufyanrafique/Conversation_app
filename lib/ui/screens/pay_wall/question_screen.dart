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
      backgroundColor: Color(0xffEFE7DE),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 40),

          Padding(
            padding: const EdgeInsets.only(left: 34.0,right: 34),
            child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                height: 37.87,
                width: 37.87,
               decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.87),
               border: Border.all(
               color: Color(0xFFEFE7DE),
               width: 1,
                ),
              ),
              child: Image(image: AssetImage(AppImages.foucsarrow)),
            ),
               Text(
                "CARD ${provider.currentIndex + 1} OF ${provider.totalCards}",
                style: GoogleFonts.jost(
                      fontSize:10,
                      color:Color(0xFFA09890),
                      letterSpacing:1.8,
                      fontWeight: FontWeight.w400,
                    ),
              ),
             QuestionDotIndicator(
             currentIndex: provider.currentIndex,
            total: provider.cards.length,
    ),
            ],),
          ),
            Spacer(),

            QuestionScreenCard(card: provider.currentCard),
            //  SizedBox(
            //   height: 250,
            //   child: PageView.builder(
            //     controller: provider.pageController,
            //     onPageChanged: provider.onPageChanged,
            //     itemCount: provider.cards.length,
            //     itemBuilder: (context, index) {
            //       return QuestionScreenCard(
            //         card: provider.cards[index],
            //       );
            //     },
            //   ),
            // ),
           
            Spacer(),

            QuestionScreenbottomNav(),
          ],
        ),
      ),
    );
  }
}