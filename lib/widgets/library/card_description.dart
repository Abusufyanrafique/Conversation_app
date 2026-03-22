import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardDescription extends StatelessWidget {
  final String description;
 
  const CardDescription({super.key, required this.description});
 
  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: GoogleFonts.jost(
                 fontSize:9,
                 color: Colors.white,
                 fontWeight: FontWeight.w400,
                
                        ),
    );
  }
}