import 'package:conversation_app/Utils/app_text.dart' as AppText;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BeginButton extends StatefulWidget {
  final VoidCallback onTap;
  final String? text;
  const BeginButton({
    super.key, 
    required this.onTap,  
    this.text
   
    
    });

  @override
  State<BeginButton> createState() => _BeginButtonState();
}

class _BeginButtonState extends State<BeginButton> {
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) => setState(() => _pressed = false),
      onTapCancel: () => setState(() => _pressed = false),
      onTap: widget.onTap,
      child: AnimatedScale(
        scale: _pressed ? 0.97 : 1.0,
        duration: const Duration(milliseconds: 120),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 18),
          decoration: BoxDecoration(
            color: const Color(0xFF2B2622),
            borderRadius: BorderRadius.circular(15.87),
          ),
          alignment: Alignment.center,
          child: Text(
            widget.text ?? AppText.beginsession,
            style: GoogleFonts.jost(
              fontSize: 12,
              letterSpacing: 2.16,
              color: const Color(0xFFF4EFEA),
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}