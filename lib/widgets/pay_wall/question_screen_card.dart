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
      // width:357 ,
      padding: EdgeInsets.only(top: 32,left: 28.37,bottom: 47),
      margin: EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 15,
        ),
      decoration: BoxDecoration(
        color: Color(0xFFF4EFEA).withOpacity(0.01),
        borderRadius: BorderRadius.circular(15.27),
        border: Border.all(
          color: Color(0xffFFFFFF),
          width: 1.02,
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
          SizedBox(height: 18.35,),
          Container(
          width: 26.93,
          height: 1.44,
          decoration: BoxDecoration(
          gradient: LinearGradient(
          colors: [
        Color(0xFF7A6F66),
        Color(0xFFD4ADA7),
      ],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ),
  ),
),
          SizedBox(height: 15),
          Padding(
          padding: const EdgeInsets.only(left: 10),
          child: RichText(
          textAlign: TextAlign.start,
          text: TextSpan(
            
          style: TextStyle(
            fontSize: 27,
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

  final index = text.indexOf(keyword);

  return [
    TextSpan(text: text.substring(0, index)),
    TextSpan(
      text: keyword,
      style: TextStyle(color: Color(0xFF7A6F66)),
    ),
    TextSpan(text: text.substring(index + keyword.length)),
  ];
}
}