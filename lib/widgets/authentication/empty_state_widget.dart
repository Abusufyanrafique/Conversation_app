import 'package:conversation_app/Utils/app_images.dart';
import 'package:flutter/material.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // ─── Inner solid circle ───
          Container(
            width: 80,
            height:80,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              // color: Color(0xFFEDE8E3),
            ),
          ),
      
          // ─── Chat icon (neeche) ───
          Positioned(
            bottom: 10,
            child: Image.asset(
              'assets/images/authentication/criclelogo.png',  
              width: 80,
              height:80,
            ),
          ),
      
          // ─── Upper image (chat icon ke upar) ───
          Positioned(
            bottom: 25,  
            child: Image.asset(
              AppImages.couples,  
              width: 41,
              height: 49,
            ),
          ),
        ],
      ),
    );
  }
}

