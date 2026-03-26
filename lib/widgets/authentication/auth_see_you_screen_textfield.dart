// lib/widgets/auth_text_field.dart

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthSeeYouScreenTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final bool isPassword;
  final bool isPasswordVisible;
  final VoidCallback? onTogglePassword;

  const AuthSeeYouScreenTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.isPassword = false,
    this.isPasswordVisible = false,
    this.onTogglePassword,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Label ──
        Padding(
          padding: const EdgeInsets.only(left:6.0),
          child: Text(
            label,
            style: GoogleFonts.jost(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              letterSpacing: 1.8,
              color: const Color(0xFF9C9590),
            ),
          ),
        ),

        const SizedBox(height: 8),

        // ── TextField ──
        SizedBox(
          height: 55,
          child: TextFormField(
            controller: controller,
            obscureText: isPassword && !isPasswordVisible,
            cursorHeight: 14,
             cursorColor: Color(0xFF7A6F66),
            style: GoogleFonts.jost(
              fontSize: 14,
              color: const Color(0xFF7A6F66).withOpacity(0.6),
            ),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: GoogleFonts.jost(
                fontSize: 14,
                color: const Color(0xFFB8AFA8),
              ),
              filled: true,
              fillColor: const Color(0xFFEFE7DE),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 16,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.87),
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 1
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.87),
                borderSide: BorderSide(
                  color: Colors.white,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.87),
                borderSide: const BorderSide(
                  color: Colors.white,
                  width: 1,
                ),
              ),
              // ── Password Toggle Icon ──
              suffixIcon: isPassword
                  ? IconButton(
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: const Color(0xFFB8AFA8),
                        size: 18,
                      ),
                      onPressed: onTogglePassword,
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}