// TOP BAR
// ─────────────────────────────────────────────
 
import 'package:conversation_app/Utils/app_colors.dart';
import 'package:conversation_app/Utils/app_text.dart' as AppText;
import 'package:conversation_app/widgets/saved_conversations/toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RichText(
            text:  TextSpan(
              children: [
                TextSpan(
                  text: AppText.savedtext,
                   style: GoogleFonts.jost(
                        fontSize: 28, 
                        color: const Color(0xFF2B2622),
                        fontWeight: FontWeight.w300,
                      ),
                ),
                TextSpan(
                  text:AppText.conversations,
                   style: GoogleFonts.jost(
                        fontSize: 28, 
                        color: const Color(0xFF7A6F66),
                        fontWeight: FontWeight.w300,
                      ),
                ),
                TextSpan(
                  text: '.',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
          const ToggleSwitch(),
        ],
      ),
    );
  }
}