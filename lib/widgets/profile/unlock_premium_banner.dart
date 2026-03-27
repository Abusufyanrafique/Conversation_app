import 'package:conversation_app/Utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UnlockPremiumBanner extends StatelessWidget {
  const UnlockPremiumBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFF4EFEA).withOpacity(0.01),
        borderRadius: BorderRadius.circular(15.27),
        border: Border.all(
          color: Colors.white, 
          width: 1,
          ),
      ),
      child: Row(
        children: [
          Container(
            width: 40.52,
            height: 40.52,
            decoration: BoxDecoration(
              color: const Color(0xFFCCA6A0).withOpacity(0.25),
              border: Border.all(
                color: Color(0xFFCCA6A0).withOpacity(0.32),
                width: 0.98,
              ),
              borderRadius: BorderRadius.circular(12.54),
            ),
            child: Image(
            image: AssetImage(AppImages.daimondicon)),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Unlock ',
                        style: GoogleFonts.jost(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF1C1A17),
                        ),
                      ),
                      TextSpan(
                        text: 'Premium.',
                        style: GoogleFonts.jost(
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w300,
                          color: const Color(0xFFB5857D),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'All decks, personal daily prompts, and unlimited saves.',
                  style: GoogleFonts.jost(
                    fontSize: 10,
                    color: const Color(0xFF9D9890),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: const Icon(
              Icons.chevron_right,
              size: 19,
              color: Color(0xFF9D9890),
            ),
          ),
        ],
      ),
    );
  }
}