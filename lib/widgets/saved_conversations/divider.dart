// DIVIDER
// ─────────────────────────────────────────────
 
import 'package:conversation_app/Utils/app_colors.dart';
import 'package:flutter/material.dart';

class _Divider extends StatelessWidget {
  const _Divider();
 
  @override
  Widget build(BuildContext context) {
    return Container(height: 0.5, color: AppColors.cardBorder);
  }
}