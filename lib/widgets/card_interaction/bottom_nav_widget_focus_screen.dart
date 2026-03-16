import 'package:conversation_app/Utils/app_images.dart';
import 'package:conversation_app/providers/Card_Interation/Cardprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CardFocusScreenProvider>();

    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(
        horizontal: 20, 
        vertical: 12
        ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.white.withOpacity(0.4), 
            width: 1
            ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // SizedBox(height: 10,),
          // Back button
          _NavButton(
            imagePath: AppImages.foucsarrow,
            onTap: provider.canGoPrevious ? provider.goToPrevious : null,
          ),

          // Next button
          _NextButton(
            label: provider.canGoNext ? 'NEXT CARD →' : 'NEXT →',
            onTap: provider.canGoNext ? provider.goToNext : null,
          ),

          // Heart button
          _NavButton(
            imagePath: AppImages.heart,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
 final String? imagePath;
  final VoidCallback? onTap;

  const _NavButton({
    this.imagePath,
     this.onTap
     });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Color(0xFF2B2622),
          borderRadius: BorderRadius.circular(15.87),
            border: Border.all(
            color: Color(0xFFF4EFEA).withOpacity(0.1),  // border color
            width: 2.0,          // border width
    ),
        ),
        child:Image.asset(imagePath!)
      ),
    );
  }
}

class _NextButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;

  const _NextButton({required this.label, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 218,
        decoration: BoxDecoration(
          color: Color(0xFF2B2622),
           border: Border.all(
            color: Color(0xFFF4EFEA).withOpacity(0.1),  // border color
            width: 2.0,          // border width
    ),
          borderRadius: BorderRadius.circular(15.87),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(           
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color:Color(0xFFF5F0EB),
              letterSpacing: 1.84,
            ),
          ),
        ),
      ),
    );
  }
}