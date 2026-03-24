// ================= HEADER =================
import 'package:conversation_app/Utils/app_images.dart';
import 'package:conversation_app/Utils/app_text.dart' as AppText;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 14.0),
      child: Column(
        children:  [
          SizedBox(height:10),
          Image(
            height: 53,
            width: 50,
            image: AssetImage(AppImages.couples)),
          SizedBox(height:5),
         RichText(
         textAlign: TextAlign.center, // center the whole text block
         text: TextSpan(
         style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        height: 1.2,
        color: Colors.black, // default color for the first part
      ),
      children: [
        TextSpan(
          text: AppText.keepconversation, 
          style: GoogleFonts.jost(
                 fontSize:34,
                 color: Color(0xFF221F1C),
                  fontStyle: FontStyle.italic,
                 fontWeight: FontWeight.w300,
                
                        ),
        ),
        TextSpan(
          text: AppText.going, // second part
           style: GoogleFonts.jost(
                 fontSize:36,
                 color: Color(0xFFBF9088),
                  fontStyle: FontStyle.italic,
                 fontWeight: FontWeight.w300,
                 height:0.9,
                
                        ),
        ),
      ],
        ),
      ),
          SizedBox(height: 14),
          Text(
            AppText.unlockdeeper,
            textAlign: TextAlign.center,
             style: GoogleFonts.jost(
                 fontSize:14,
                 color: Color(0xFF6B6460),
                  fontStyle: FontStyle.italic,
                 fontWeight: FontWeight.w300,
                 height:1.3,
                
                        ),
          ),
        ],
      ),
    );
  }
}