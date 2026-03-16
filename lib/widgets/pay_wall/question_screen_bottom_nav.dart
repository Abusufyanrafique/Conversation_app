import 'package:conversation_app/Utils/app_images.dart';
import 'package:conversation_app/providers/Paywall/question_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QuestionScreenbottomNav extends StatelessWidget {
  const QuestionScreenbottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QuestionScreenProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        children: [
           Container(
                height: 37.87,
                width: 37.87,
               decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.87),
               border: Border.all(
               color: Color(0xFFEFE7DE),
               width: 1,
                ),
              ),
              child: Image(image: AssetImage(AppImages.foucsarrow)),
            ),
            SizedBox(width: 5,),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.87),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF2B2622),
                  
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: provider.nextCard,
                child: Text("NEXT CARD",
                 style: GoogleFonts.jost(
                        fontSize:11.5,
                        color:Color(0xFFF5F0EB),
                        letterSpacing:1.84,
                        fontWeight: FontWeight.w400,
                      ),
                ),
              ),
            ),
          ),
          SizedBox(width: 5,),
          Container(
                height: 37.87,
                width: 37.87,
               decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.87),
               border: Border.all(
               color: Color(0xFFEFE7DE),
               width: 1,
                ),
              ),
              child: Image(image: AssetImage(AppImages.heart)),
            ),
        ],
      ),
    );
  }
}