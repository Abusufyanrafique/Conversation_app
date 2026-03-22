// HEADER WIDGET
// ─────────────────────────────────────────
 
import 'package:conversation_app/providers/library/library_provider.dart';
import 'package:conversation_app/widgets/library/plan_badge.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LibraryHeader extends StatelessWidget {
  const LibraryHeader({super.key});
 
  @override
  Widget build(BuildContext context) {
    final isPremium = context.watch<LibraryProvider>().isPremium;
 
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text:  TextSpan(
              style: TextStyle(
                fontSize: 28,
                color: Color(0xFF3B2F2F),
                fontFamily: 'Georgia',
              ),
              children: [
                TextSpan(
                  text: 'The ',
                 style: GoogleFonts.jost(
                 fontSize:30,
                 color: Color(0xFF2B2622),
                 fontWeight: FontWeight.w300,
                
                        ),
                ),
                TextSpan(
                  text: 'Library.',
                  style: GoogleFonts.jost(
                 fontSize:30,
                 color: Color(0xFF7A6F66),
                 fontWeight: FontWeight.w300,
                
                        ),
                ),
              ],
            ),
          ),
          PlanBadge(isPremium: isPremium),
        ],
      ),
    );
  }
}