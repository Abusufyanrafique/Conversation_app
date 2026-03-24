import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UnlimitedConversationCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? imagepath;
  final bool isChecked;
  final Color? iconBoxColor;
  final Color? checkColor;

  const UnlimitedConversationCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.imagepath,
    this.isChecked = true,
    this.iconBoxColor,
    this.checkColor,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 76,
        width: 328,
        padding: const EdgeInsets.symmetric(
          horizontal:18.0, 
          vertical: 14.0
          ),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F0EB).withOpacity(0.3),
          borderRadius: BorderRadius.circular(15.35),
          border: Border.all(
            color:  Colors.white,
            width:0.96,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // Left Icon Box
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: iconBoxColor ?? const Color(0xFFD4ADA7).withOpacity(0.2),
                borderRadius: BorderRadius.circular(14.0),
                 border: Border.all(
                 color:  Color(0xFFD4ADA7).withOpacity(0.3),
                 width:0.96,
          ),
              ),
              child: Center(
                child:Image(
                  image: AssetImage(imagepath!))
              ),
            ),
      
            const SizedBox(width: 12.37),
      
            // Text Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.jost(
                        fontSize: 11,                    
                        color: const Color(0xFF2B2622),
                        fontWeight: FontWeight.w400,
                      ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    subtitle,
                    style: GoogleFonts.jost(
                        fontSize:8.73,                    
                        color: const Color(0xFF7A6F66).withOpacity(0.8),
                        fontWeight: FontWeight.w400,
                      ),
                  ),
                ],
              ),
            ),
      
            const SizedBox(width: 12),
      
            // Right Checkmark Circle
            Container(
              width:18,
              height: 18,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isChecked
                    ? (checkColor ?? const Color(0xFFAEBAA8)).withOpacity(0.3)
                    : Colors.transparent,
                border: Border.all(
                  color: checkColor ?? const Color(0xFFAEBAA8),
                  width: 1.5,
                ),
              ),
              child: isChecked
                  ? Center(
                      child: Icon(
                        Icons.check,
                        size: 8,
                        color: checkColor ?? const Color(0xFFA8C4A0),
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
