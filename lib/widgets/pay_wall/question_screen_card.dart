import 'package:conversation_app/models/pay_wall/question_screen_model.dart';
import 'package:flutter/material.dart';

class QuestionScreenCard extends StatelessWidget {
  final QuestionScreenModel card;

  const QuestionScreenCard({
    super.key, 
    required this.card
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      margin: EdgeInsets.symmetric(horizontal: 60,),
      decoration: BoxDecoration(
        color: Color(0xFFF4EFEA).withOpacity(0.01),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Color(0xffFFFFFF)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(right:100.0),
            child: Text(
              card.title,
              style: TextStyle(
                fontSize: 12,
                letterSpacing: 2,
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Text(
              card.question,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ],
      ),
    );
  }
}