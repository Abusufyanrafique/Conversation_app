import 'package:flutter/material.dart';

class DeckModel {
  final String id;
  final String title;
  final String subtitle;
  final IconData icon;
  final String imagePath;
  final double imageHeight;
  final double imageWidth;
  final double leftPadding; 
  final double toppadding;
  const DeckModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.icon, 
    required this.imagePath, 
    required this.imageHeight, 
    required this.imageWidth, 
    required this.leftPadding, 
    required this.toppadding,
  });
}