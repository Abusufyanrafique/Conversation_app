import 'package:conversation_app/Utils/app_images.dart';
import 'package:conversation_app/Utils/app_text.dart' as AppText;
import 'package:conversation_app/ui/screens/pay_wall/user_type_screen.dart';
import 'package:conversation_app/widgets/card_interaction/begin_button.dart';
import 'package:conversation_app/widgets/card_interaction/container_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    final double topSpacing = screenHeight * 0.060;
    final double cardStackSpacing = screenHeight * 0.08;
    final double cardWidth = screenHeight * 0.170;
    final double cardHeight = screenHeight * 0.23;
    final double headingFontSize = screenHeight * 0.046;
    final double subtitleFontSize = screenHeight * 0.018;
    final double midSpacing = screenHeight * 0.024;
    final double buttonSpacing = screenHeight * 0.030;

    return Scaffold(
      backgroundColor: const Color(0xFFEFE7DE),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: topSpacing),

                Stack(
                  alignment: Alignment.center,
                  children: [
                    ContainerCard(
                      width: cardWidth + 5,
                      height: cardHeight,
                      angle: -22,
                      x: -20,
                      y: 8,
                      color: const Color(0xFFE2D1CC),
                      shadowColor: const Color(0xFFEFE4DF),
                    ),
                    ContainerCard(
                      width: cardWidth,
                      height: cardHeight,
                      angle: -10,
                      x: -12,
                      y: -6,
                      color: const Color(0xFFE3D0CB),
                    ),
                    ContainerCard(
                      width: cardWidth,
                      height: cardHeight,
                      angle: -15,
                      x: -10,
                      y: -6,
                      color: const Color(0xFFD0D6CD).withOpacity(0.7),
                    ),
                    ContainerCard(
                      width: cardWidth,
                      height: cardHeight,
                      angle: -3,
                      x: -1,
                      y: -17,
                      color: const Color(0xFFC59D97),
                      child: Column(
                        children: [
                          SizedBox(height: cardHeight * 0.36),
                          Image(image: AssetImage(AppImages.couples)),
                          SizedBox(height: cardHeight * 0.05),
                          Center(
                            child: Image(
                              image: AssetImage(AppImages.finallogo),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: cardStackSpacing),

                Text(
                  AppText.collection,
                  style: GoogleFonts.jost(
                    fontSize: 10,
                    color: const Color(0xFFA09890),
                    fontWeight: FontWeight.w300,
                    letterSpacing: 3.08,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 12),

                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: AppText.questionworth,
                        style: GoogleFonts.jost(
                          fontSize: headingFontSize,
                          color: const Color(0xFF2B2622),
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      TextSpan(
                        text: AppText.sittingwith,
                        style: GoogleFonts.jost(
                          fontSize: headingFontSize,
                          color: const Color(0xFF7A6F66),
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w300,
                          height: 0.8,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: midSpacing),

                Text(
                  AppText.littledeeper,
                  style: GoogleFonts.jost(
                    fontSize: subtitleFontSize,
                    color: const Color(0xFF7A6F66),
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.center,
                ),

                SizedBox(height: buttonSpacing),

                BeginButton(
                  text: ' BEGIN → ',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UserTypeScreen(),
                      ),
                    );
                  },
                ),

                SizedBox(height: buttonSpacing * 0.5),

                TextButton(
                  onPressed: () {},
                  child: Text(
                    AppText.alreadyhaveaccount,
                    style: GoogleFonts.jost(
                      fontSize: 11.5,
                      letterSpacing: 1.61,
                      color: const Color(0xFF7A6F66),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  AppText.privacypolicy,
                  style: GoogleFonts.jost(
                    fontSize: 10,
                    letterSpacing: 0.4,
                    color: const Color(0xFFA09890),
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}