import 'package:flutter/material.dart';

class ContainerCard extends StatelessWidget {
  final double width;
  final double height;
  final double angle;
  final double x;
  final double y;
  final Widget? child;
  final Color? color; 

  // Gradient
  final List<Color>? gradientColors;
  final AlignmentGeometry gradientBegin;
  final AlignmentGeometry gradientEnd;

  // Border
  final Color borderColor;
  final double borderWidth;

  // Shadow
  final Color shadowColor;
  final double shadowBlur;
  final double shadowSpread;
  final Offset shadowOffset;

  const ContainerCard({
    super.key,
    required this.width,
    required this.height,
    this.angle = 0,
    this.x = 0,
    this.y = 0,
    this.child,
    this.color, 
    this.gradientColors, 
    this.gradientBegin = Alignment.topLeft,
    this.gradientEnd = Alignment.bottomRight,
    this.borderColor = const Color(0x1FFFFFFF),
    this.borderWidth = 0.93,
    this.shadowColor = const Color(0xFFEFE4DF),
    this.shadowBlur = 4.82,
    this.shadowSpread = 0,
    this.shadowOffset = const Offset(0, 3.7),
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(x, y),
      child: Transform.rotate(
        angle: angle * 3.14159 / 180,
        child: Container(
          width: width,
          height: height,
          padding: const EdgeInsets.all(9.26),
          decoration: BoxDecoration(
            //  gradient ya color — jo pass karo wahi lagega
            color: gradientColors == null ? color : null,
            gradient: gradientColors != null
                ? LinearGradient(
                    begin: gradientBegin,
                    end: gradientEnd,
                    colors: gradientColors!,
                  )
                : null,
            borderRadius: BorderRadius.circular(14.82),
            border: Border.all(
              color: borderColor,
              width: borderWidth,
            ),
            boxShadow: [
              BoxShadow(
                color: shadowColor,
                blurRadius: shadowBlur,
                spreadRadius: shadowSpread,
                offset: shadowOffset,
              ),
            ],
          ),
          child: child,
        ),
      ),
    );
  }
}