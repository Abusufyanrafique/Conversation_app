// EMPTY STATE
// ─────────────────────────────────────────────
 
import 'package:conversation_app/Utils/app_text.dart' as AppText;
import 'package:conversation_app/widgets/saved_conversations/action_buttons.dart';
import 'package:conversation_app/widgets/saved_conversations/stacked_cards.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const StackedCards(),
        const SizedBox(height: 20),
         Text(
           AppText.nothingsaved,
           style: GoogleFonts.jost(
                        fontSize:30, 
                        color: const Color(0xFF2B2622),
                        fontWeight: FontWeight.w300,
                      ),
          
        ),

         Text(
         AppText.justyet,
         style: GoogleFonts.jost(
                        fontSize:30, 
                        color: const Color(0xFF7A6F66),
                        fontWeight: FontWeight.w300,
                      ),
        ),
        const SizedBox(height: 10),
         Text(
          AppText.savedmeaningfulquestions,
          textAlign: TextAlign.center,
          style: GoogleFonts.jost(
          fontSize:16, 
          color: const Color(0xFF9C9890),
           fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w300,
                      ),
        ),
        const SizedBox(height: 36),
        ActionButtons(),
      ],
    );
  }
}
 