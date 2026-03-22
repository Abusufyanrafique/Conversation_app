import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OutlinedBtn extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
 
  const OutlinedBtn({
    super.key, 
    required this.label, 
    required this.onTap
    
    });
 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 127,
        height: 33,
        padding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color:Color(0xFFF4EFEA).withOpacity(0.10),
          borderRadius: BorderRadius.circular(14.42),
          border: Border.all(color:Colors.white, width: 0.96),
        ),
        child: Center(
          child: Text(
            label,
             style: GoogleFonts.jost(
            fontSize: 8.7, 
            color: const Color(0xFF62605A),
            fontWeight: FontWeight.w400,
                        ),
          ),
        ),
      ),
    );
  }
}