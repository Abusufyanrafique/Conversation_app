import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GuestNotice extends StatelessWidget {
  const GuestNotice({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 334,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.87),
        border: Border.all(
          color: Colors.white,
          width: 1.06,
        ),
      ),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // Span text (3 parts)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 12.0,
                bottom: 12, 
                left:15,
                right:15,
                ),
              child: RichText(
                text: TextSpan(
                  style: GoogleFonts.jost(
                    fontSize: 13.78,
                    letterSpacing: 0.55,
                    color: const Color(0xFF2B2622),
                    fontWeight: FontWeight.w400,
                  ),
                  children:  [
                     WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: Padding(
              padding: const EdgeInsets.only(right: 4),
              child: Image.asset(
                'assets/icons/authentication/guestmode.png', // 👈 apna icon path yahan dein
                width: 14,
                height: 14,
              ),
            ),
          ),
                    TextSpan(
                      text: "Guest mode is limited ",
                     style: GoogleFonts.jost(
                    fontSize: 12,
                    color: const Color(0xFF5C5651),
                    fontWeight: FontWeight.w400,
                  ),
                    ),
                    TextSpan(
                      text: "— you won't be able to save favorites or restore purchases. ",
                    style: GoogleFonts.jost(
                    fontSize: 12,
                    color: const Color(0xFF9C9590),
                    fontWeight: FontWeight.w400,
                  ),
                    ),
                    TextSpan(
                      text: "Learn more →",
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
          ),
        ],
      ),
    );
  }
}