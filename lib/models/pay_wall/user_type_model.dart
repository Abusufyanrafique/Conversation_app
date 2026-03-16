import 'package:flutter/material.dart';

class UserTypeModel {
  final String id;
  final String title;
  final String subtitle;
  final Color backgroundColor;
   final String? imagePath;

  const UserTypeModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.backgroundColor, 
    this.imagePath,
  });
}