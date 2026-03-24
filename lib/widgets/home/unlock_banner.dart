import 'package:conversation_app/Utils/app_colors.dart';
import 'package:conversation_app/Utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class UnlockBanner extends StatelessWidget {
  const UnlockBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: AppColors.morewaitingcard,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: AppColors.bordercolorwaitingcard,
            width: 1,
            ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heart icon
            Container(
              width: 43.99,
              height: 43.99,
              decoration: BoxDecoration(
                color:Color(0xFFCFA8A2).withOpacity(0.26),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: Color(0xFFCFA8A2).withOpacity(0.29),
                  width: 1,
                )
              ),
              child: Image(image: AssetImage(AppImages.blackheart))
            ),
            const SizedBox(height: 12),

            // Title
            RichText(
              text:  TextSpan(
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  // color: AppColors.textDark,
                ),
                children: [
                  TextSpan(text: 'There\'s ',
                  style: GoogleFonts.jost(
                  fontSize: 20,
                  color: Color(0xFF2B2622),
                  fontWeight: FontWeight.w300,
          
        ),
                  ),
                  TextSpan(
                    text: 'more ',
                  style: GoogleFonts.jost(
                  fontSize: 20,
                  color: Color(0xFF7A6F66),
                  fontWeight: FontWeight.w300,
          
        ),
                  ),
                  TextSpan(text: 'waiting.',
                  style: GoogleFonts.jost(
                  fontSize: 20,
                  color: Color(0xFF2B2622),
                  fontWeight: FontWeight.w300,
          
        ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),

            // Description
             Text(
              'Ten more decks, personalized daily prompts, and the ability to save the questions that hit home — all yours.',
                style: GoogleFonts.jost(
                  fontSize: 10,
                  color: Color(0xFF7A6F66),
                  fontWeight: FontWeight.w400,
          
        ),
            ),
            const SizedBox(height: 8),

            // Feature bullets
            _FeatureBullet(text: '10 more decks  •  Daily prompts'),
            const SizedBox(height: 4),
            _FeatureBullet(text: 'Save Favourites'),
            const SizedBox(height: 14),

            // Disclaimer
             Text(
              'Some conversations only happen\n when you make space for them.',
              style: GoogleFonts.jost(
                  fontSize: 12,
                  color:Color(0xFF7A6F66),
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic,
          
        ),
            ),
            const SizedBox(height: 14),

            // Unlock button
            SizedBox(
              // width: double.infinity,
              height: 44,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor:Color(0xFF2B2622),
                  
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                child:  Text(
                  'UNLOCK →',
                  style: GoogleFonts.jost(
                  fontSize: 10,
                  color:Colors.white,
                  fontWeight: FontWeight.w400,
          
        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FeatureBullet extends StatelessWidget {
  final String text;
  const _FeatureBullet({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 14,
          height: 14,
          decoration:  BoxDecoration(
            shape: BoxShape.circle,
            color:Color(0xFFF4EFEA).withOpacity(0.18),
            border: Border.all(
              color:Color(0xFFCFA8A2).withOpacity(0.2) ,
            )
          ),
          child: const Icon(Icons.check, size: 8, color: AppColors.textMedium),
        ),
        const SizedBox(width: 6),
        Text(
          text,
           style: GoogleFonts.jost(
                  fontSize: 8.9,
                  color: Color(0xFF7A6F66),
                  fontWeight: FontWeight.w400,
          
        ),
        ),
      ],
    );
  }
}