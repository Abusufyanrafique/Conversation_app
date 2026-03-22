import 'package:flutter/material.dart';

class CardTile extends StatelessWidget {
  final String imagePath;
  final Offset offset;
  final EdgeInsets? margin;
  final double? width;
  final double? height;

  const CardTile({
    super.key,
    required this.imagePath,
    required this.offset,
    this.margin,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
   
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final cardWidth = width ?? screenWidth * 0.42;   // Screen ka 42%
    final cardHeight = height ?? screenHeight * 0.22; // Screen ka 22%

    return Transform.translate(
      offset: offset,
      child: Container(
        margin: margin,
        width: cardWidth,
        height: cardHeight,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}