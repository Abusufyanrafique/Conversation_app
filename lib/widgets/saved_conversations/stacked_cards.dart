import 'package:conversation_app/Utils/app_images.dart';
import 'package:conversation_app/widgets/saved_conversations/card_tile.dart';
import 'package:flutter/material.dart';

class StackedCards extends StatelessWidget {
  const StackedCards({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 240,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          // Back card – tilted left
          Transform.rotate(
            angle: -0.18,
            child: CardTile(
              margin: EdgeInsets.only(top: 40,right: 100),
              imagePath: AppImages.greensavedcard,
              offset: const Offset(-10, -10),
            ),
          ),
          // Back card – tilted right
          Transform.rotate(
            angle: 0.40,
            child: CardTile(
              margin: EdgeInsets.only(
                top: 10,
                left: 100
              ),
              imagePath: AppImages.bluesavedcard,
              offset: const Offset(10, 0),
            ),
          ),
          // Front card
          CardTile(
            margin: EdgeInsets.only(top: 20, bottom: 20),
            imagePath: AppImages.brownsavedcard,
            offset: Offset.zero,
          ),
          // Heart icon button
          Positioned(
            bottom: 0,
            child: Container(
              width: 46,
              height: 44,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white.withOpacity(0.3),
                ),
                gradient: LinearGradient(colors: [
                  Color(0xFFCCA6A0),
                  Color(0xFFB5857D),
                ]),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image(image: AssetImage(AppImages.blackheart)),
            ),
          ),
        ],
      ),
    );
  }
}