import 'package:conversation_app/Utils/app_images.dart';
import 'package:conversation_app/Utils/app_text.dart' as AppText;
import 'package:flutter/material.dart';
import 'package:conversation_app/Utils/app_textstyles.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationCardWidget extends StatelessWidget {
  const NotificationCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 188,
      width: 350,
      padding: const EdgeInsets.only(left: 14, right: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF3F3A35).withOpacity(0.20),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: Color(0xFF3A3533),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000).withOpacity(0.25),
            offset: const Offset(0, 4),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: .0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 27),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 37,
                      width: 37,
                      decoration: BoxDecoration(
                        color: const Color(0xFF716A66),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0xFF9C9590),
                          width: 2,
                        ),
                      ),
                      child: Image(image: AssetImage(AppImages.couples)),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      AppText.theconversation,
                      style: AppTextStyles.jost(
                        fontSize: 10,
                        color: Color(0xFF9C9590),
                        letterSpacing: 0.73,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Text(
                  AppText.now,
                  style: AppTextStyles.jost(
                    fontSize: 11,
                    color: Color(0xFF9C9590),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 14.0),
              child: Text(
                AppText.todayquestion,
                style: GoogleFonts.cormorant(
                  fontSize: 17,
                  color: Color(0xFFF4EFEA),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 19),
            Padding(
              padding: const EdgeInsets.only(left: 14.0),
              child: Text(
                AppText.sayone,
                style: AppTextStyles.jost(
                  fontSize: 10.5,
                  color: Color(0xFF9C9590),
                  letterSpacing: 0.73,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}