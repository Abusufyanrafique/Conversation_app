import 'package:conversation_app/models/pay_wall/question_screen_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreenCard extends StatelessWidget {
  final QuestionScreenModel card;

  const QuestionScreenCard({
    super.key, 
    required this.card
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height:200 ,
      // width:327 ,
      padding: EdgeInsets.all(24),
      margin: EdgeInsets.symmetric(horizontal: 40,vertical: 15),
      decoration: BoxDecoration(
        color: Color(0xFFF4EFEA).withOpacity(0.01),
        borderRadius: BorderRadius.circular(15.27),
        border: Border.all(
          color: Color(0xffFFFFFF),
          
          ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            card.title,
            style: GoogleFonts.jost(
            fontSize: 9.14,
            letterSpacing: 1.28,                    
            color: const Color(0xFFA09890),
            fontWeight: FontWeight.w400,
                      ),
          ),
          SizedBox(height: 20),
          Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
          style: TextStyle(
         fontFamily: "PeachBlue",
         color: Color(0xFF2B2622),
      ),
      children: _buildTextSpans(card.question),
    ),
  ),
),
        ],
      ),
    );
  }
  List<TextSpan> _buildTextSpans(String text) {
  final keyword = "understand";

  if (!text.contains(keyword)) {
    return [TextSpan(text: text)];
  }

  final parts = text.split(keyword);

  return [
    TextSpan(text: parts[0]),
    TextSpan(
      text: keyword,
      style: TextStyle(color: Color(0xFF7A6F66)), 
    ),
    if (parts.length > 1) TextSpan(text: parts[1]),
  ];
}
}