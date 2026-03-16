import 'package:conversation_app/Utils/app_textstyles.dart';
import 'package:conversation_app/providers/OnboardingProvider/card_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class TapLabelWidget extends StatelessWidget {
  const TapLabelWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isRevealed = context.watch<CardProvider>().isRevealed;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          isRevealed ? '2  FLIP THE CARD' : '1  TAP THE CARD',
          style:AppTextStyles.jost(
          letterSpacing:1.6 ,
         color: Color(0xFF5C5651),
         fontSize: 10,
         fontWeight: FontWeight.w400,
 
  ),
        ),
      ],
    );
  }
}