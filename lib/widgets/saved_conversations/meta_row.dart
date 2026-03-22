import 'package:conversation_app/providers/SavedConversationsProvider/saved_conversations_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MetaRow extends StatelessWidget {
  const MetaRow({super.key});

  @override
  Widget build(BuildContext context) {
    final count = context.watch<SavedConversationsProvider>().cardCount;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Text(
            'SAVED',
             style: GoogleFonts.jost(
                        fontSize: 10, 
                        color: const Color(0xFF7A6F66),
                        letterSpacing: 2.28,
                        fontWeight: FontWeight.w400,
                      ),
          ),

          // ─── Gradient Divider ───────────────────────────
          Expanded(
            child: Container(
              height: 0.98,
              margin: const EdgeInsets.symmetric(horizontal: 12),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0x2E9E9890), // #9E98902E
                    Color(0x009E9890), 
                  ],
                ),
              ),
            ),
          ),

          Text(
            '$count CARDS',
              style: GoogleFonts.jost(
                        fontSize: 10, 
                        letterSpacing: 2.28,
                        color: const Color(0xFF7A6F66),
                        fontWeight: FontWeight.w400,
                      ),
          ),
        ],
      ),
    );
  }
}