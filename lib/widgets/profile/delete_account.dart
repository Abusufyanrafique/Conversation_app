import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeleteAccount extends StatelessWidget {
  final VoidCallback? onTap;

  const DeleteAccount({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 22),
        decoration: BoxDecoration(
          color: const Color(0xFFF4EFEA).withOpacity(0.01),
          borderRadius: BorderRadius.circular(15.87),
          border: Border.all(color: Colors.white),
        ),
        child: Row(
          children: [
            // Leading Icon
            Container(
              height:36 ,
              width: 36,
              decoration: BoxDecoration(
                color: Color(0xFFC0605A).withOpacity(0.12),
                borderRadius: BorderRadius.circular(11),
                border: Border.all(
                  color: Color(0xFFC0605A).withOpacity(0.20),
                  width: 1,
                )
              ),
              child:  Icon(
                Icons.warning,
                color:Colors.black,
                size: 18,
              ),
            ),

            const SizedBox(width: 12),

            // Title + Subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Delete Account',
                    style: GoogleFonts.jost(
                      fontSize: 11.19,
                      color: const Color(0xFFC06060),
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Permanently removes all your data',
                    style: GoogleFonts.jost(
                      fontSize: 9.3,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF9C9890),
                    ),
                  ),
                ],
              ),
            ),

            // Trailing Icon
            const Icon(
              Icons.chevron_right,
              size: 15,
              color: Color(0xFFC06060),
            ),
          ],
        ),
      ),
    );
  }
}