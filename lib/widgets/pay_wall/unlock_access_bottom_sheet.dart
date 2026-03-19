import 'package:conversation_app/Utils/app_text.dart' as AppText;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
 
class UnlockAccessBottomSheet extends StatelessWidget {
  const UnlockAccessBottomSheet({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(      
        color: Color(0xFFEFE7DE), 
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 24),
 
          // Monthly price text
           Text(
           AppText.monthly,
            style: GoogleFonts.jost(
            fontSize:9.4,                    
            letterSpacing: 1.2,
            color: const Color(0xFF7A6F66).withOpacity(0.7),
            fontWeight: FontWeight.w400,
                    ),
          ),
 
          const SizedBox(height: 16),
 
          // Unlock Full Access Button
          SizedBox(
            width:346,
            height: 58,
            child: ElevatedButton(
              onPressed: () {
                // TODO: handle unlock
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2B2622),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.87),
                ),
                elevation: 0,
              ),
              child:  Text(
            AppText.unlockfullaccess,
            style: GoogleFonts.jost(
            fontSize:12.5,                    
            letterSpacing:2.25,
            color: const Color(0xFFF5F0EB),
            fontWeight: FontWeight.w400,
                    ),
              ),
            ),
          ),
 
          const SizedBox(height: 16),
 
          // Maybe later
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child:  Text(
            AppText.maybelater,
            style: GoogleFonts.jost(
            fontSize:10.5,                    
            letterSpacing:1.2,
            color: const Color(0xFF7A6F66).withOpacity(0.7),
            fontWeight: FontWeight.w400,
                    ),
            ),
          ),
 
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}