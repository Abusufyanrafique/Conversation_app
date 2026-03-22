// PLAN BADGE WIDGET
// ─────────────────────────────────────────
 
import 'package:conversation_app/providers/library/library_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PlanBadge extends StatelessWidget {
  final bool isPremium;
 
  const PlanBadge({super.key, required this.isPremium});
 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<LibraryProvider>().togglePlan(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        decoration: BoxDecoration(
          color: Color(0xFF7A6F66).withOpacity(0.12),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Color(0xFF7A6F66).withOpacity(0.12),
            width: 0.98,
            
            ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 5.87,
              height: 5.87,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:Color(0xFF7A6F66),
              ),
            ),
            const SizedBox(width: 5.98),
            Text(
              isPremium ? 'PREMIUM PLAN' : 'FREE PLAN',
                style: GoogleFonts.jost(
                 fontSize:9,
                 letterSpacing: 1.3,
                 color: Color(0xFF7A6F66),
                 fontWeight: FontWeight.w300,
                
                        ),
            ),
          ],
        ),
      ),
    );
  }
}
 