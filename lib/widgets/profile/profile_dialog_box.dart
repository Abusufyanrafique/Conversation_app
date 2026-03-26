import 'package:conversation_app/Utils/app_colors.dart';
import 'package:conversation_app/Utils/app_text.dart' as AppText;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileDialogBox extends StatelessWidget {
  final VoidCallback onDelete;
  final VoidCallback onKeep;

  const ProfileDialogBox({
    super.key,
    required this.onDelete,
    required this.onKeep,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFFEEE6DD),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 32, 20, 29),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ── Warning icon ──
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.dailogueboxcolor,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppColors.dailogueboxbbordercolor,
                )
              ),
              child:  Center(
                child: Icon(
                Icons.warning_rounded,
                color:  AppColors.warningcolor,
                size: 28,
                 ),
              ),
            ),
            const SizedBox(height: 18),

            // ── Title ──
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: AppText.delete,
                    style: GoogleFonts.jost(
                      fontSize: 24,
                      fontWeight: FontWeight.w300,
                      color: AppColors.deletetextcolor,
                    ),
                  ),
                  TextSpan(
                    text: AppText.account,
                    style: GoogleFonts.cormorantGaramond(
                      fontSize: 24,
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.italic,
                      color: AppColors.accounttextcolor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 6),

            // ── Description ──
            Text(
                 AppText.cannotbeundone,
              textAlign: TextAlign.center,
              style: GoogleFonts.jost(
                fontSize: 11,
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.italic,
                color: const Color(0xFF9D9890),
               
              ),
            ),
            const SizedBox(height: 24.88),

            // ── Delete button ──
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: onDelete,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFC06060),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  side: BorderSide(
                    color: Color(0xFFC06060),
                    width: 1,
                  )
                ),
                child: Text(
                  AppText.deletemyaccount,
                  style: GoogleFonts.jost(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    letterSpacing: 1.4,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // ── Keep button ──
            SizedBox(
              width: double.infinity,
              height: 43,
              child: ElevatedButton(
                onPressed: onKeep,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                    side: BorderSide(
                      color:  Colors.white,
                      width: 1,
                    ),
                  ),
                ),
                child: Text(
                  AppText.keepmyaccount,
                  style: GoogleFonts.jost(
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF7A6F66),
                    letterSpacing: 1.4,
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