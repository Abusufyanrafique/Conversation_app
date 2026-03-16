import 'package:conversation_app/Utils/app_textstyles.dart';
import 'package:conversation_app/models/step_model.dart';
import 'package:flutter/material.dart';

class StepListWidget extends StatelessWidget {
  const StepListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(onboardingSteps.length, (index) {
        final step = onboardingSteps[index];
        return _StepItem(
          number: index + 1,
          title: step.title,
          description: step.description,
        );
      }),
    );
  }
}

class _StepItem extends StatelessWidget {
  final int number;
  final String title;
  final String description;

  const _StepItem({
    required this.number,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Number circle
          Container(
            width: 23.33,
            height: 23.33,
            decoration: BoxDecoration(
              color: const Color(0xFFA8B5A22E),
              shape: BoxShape.circle,
             
            ),
            child: Center(
              child: Text(
                '$number',
                style: AppTextStyles.jost(
                  color: Color(0xFF5C5651),
                fontSize: 16,
                fontWeight: FontWeight.w400,
     
  ),
              ),
            ),
          ),
          const SizedBox(width: 12,),
          
          // Text
          Expanded(
            child: RichText(
              text: TextSpan(
                style:   AppTextStyles.jost(
                  color: Color(0xFF1C1B1A),
                fontSize: 17,
                fontWeight: FontWeight.w400,
     
  ),
                children: [
                  TextSpan(
                    text: '$title ',
                    style:  AppTextStyles.jost(
                  color: Color(0xFF1C1B1A),
                fontSize: 17,
                fontWeight: FontWeight.w400,
     
  ),
                  ),
                
                  TextSpan(
                    text: description,
                    style:  AppTextStyles.jost(
                  color: Color(0xFF5C5651),
                fontSize: 17,
                fontWeight: FontWeight.w300,
     
  ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}