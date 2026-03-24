import 'package:conversation_app/Utils/app_images.dart';
import 'package:conversation_app/Utils/app_text.dart' as AppText;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GuestNotice extends StatelessWidget {
  const GuestNotice({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.87),
        border: Border.all(
          color: Colors.white,
          width: 1.06,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 5, 
          vertical: 16
          ),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: GoogleFonts.jost(
              fontSize: 12,
              letterSpacing: 0.55,
              color: const Color(0xFF2B2622),
              fontWeight: FontWeight.w400,
            ),
            children: [
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Image.asset(
                   AppImages.guestdotimage,
                    width: 14,
                    height: 14,
                  ),
                ),
              ),
              TextSpan(
                text:AppText.guestmodeislimited,
                style: GoogleFonts.jost(
                  fontSize: 12,
                  color: const Color(0xFF5C5651),
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: AppText.savefavourite,
                style: GoogleFonts.jost(
                  
                  fontSize: 12,
                  color: const Color(0xFF9C9590),
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: AppText.learnmore,
                style: GoogleFonts.jost(
                  letterSpacing: 0.48,
                  fontSize: 12,
                  color: const Color(0xFFB88A85),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}