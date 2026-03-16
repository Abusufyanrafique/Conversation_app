import 'package:flutter/material.dart';

class CardStack extends StatelessWidget {
  const CardStack({super.key});

  static const List<String> cardImages = [
    'assets/images/card_interation/cARD 41.png',
    'assets/images/card_interation/card3.png',
    'assets/images/card_interation/card 2.png',
    'assets/images/card_interation/card 1.png',
  ];

  // Har card ka actual background color
  static const List<Color> cardColors = [
    Color(0xFF8B8B8B), // Card 4 — gray (sabse peeche)
    Color(0xFFFF6B5B), // Card 3 — coral/red
    Color(0xFF4CAF50), // Card 2 — green
    Color(0xFFD4B896), // Card 1 — beige (sabse aage)
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 220,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Card 4 — sabse peeche, left rotate
          Transform.rotate(
            angle: -0.18,
            child: Transform.translate(
              offset: const Offset(-10, 5),
              child: _buildImageCard(
                imagePath: cardImages[0],
                bgColor: cardColors[0],
              ),
            ),
          ),

          // Card 3 — right rotate
          Transform.rotate(
            angle: 0.12,
            child: Transform.translate(
              offset: const Offset(10, 4),
              child: _buildImageCard(
                imagePath: cardImages[1],
                bgColor: cardColors[1],
              ),
            ),
          ),

          // Card 2 — halka rotate
          Transform.rotate(
            angle: -0.05,
            child: Transform.translate(
              offset: const Offset(-3, 2),
              child: _buildImageCard(
                imagePath: cardImages[2],
                bgColor: cardColors[2],
              ),
            ),
          ),

          // Card 1 — sabse aage, seedha
          Transform.rotate(
            angle: 0.0,
            child: Transform.translate(
              offset: const Offset(0, 0),
              child: _buildImageCard(
                imagePath: cardImages[3],
                bgColor: cardColors[3],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageCard({
    required String imagePath,
    required Color bgColor,
  }) {
    return Container(
      width: 148,
      height: 200,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}