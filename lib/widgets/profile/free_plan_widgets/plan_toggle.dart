import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlanToggle extends StatelessWidget {
  final bool isAnnual;
  final ValueChanged<bool> onChanged;
  const PlanToggle({
    super.key,
    required this.isAnnual,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => onChanged(false),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: !isAnnual
                    ? const Color(0xFFEFE7DE)
                    : const Color(0xFFE8E2DA),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: Colors.white,
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'MONTHLY',
                    style: GoogleFonts.jost(
                      fontSize: 9.29,
                      color: const Color(0xFF9C9890),
                      letterSpacing: 1.3,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    '\$6',
                    style: GoogleFonts.jost(
                      fontSize: 26,
                      fontWeight: FontWeight.w300,
                      color: const Color(0xFF1B1916),
                    ),
                  ),
                  Text(
                    'per month',
                    style: GoogleFonts.jost(
                      fontSize: 9.3,
                      color: const Color(0xFF9E9890),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const RadioDot(selected: false),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: GestureDetector(
            onTap: () => onChanged(true),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isAnnual
                    ? const Color(0xFFF4EFEA).withOpacity(0.01)
                    : const Color(0xFF7A6F66).withOpacity(0.18),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: const Color(0xFF7A6F66).withOpacity(0.40),
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: const Color(0xFFA8B8A2).withOpacity(0.22),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color(0xFFA8B8A2),
                      ),
                    ),
                    child: Text(
                      'SAVE 18%',
                      style: GoogleFonts.jost(
                        fontSize: 8,
                        color: const Color(0xFFA8B8A2),
                        letterSpacing: 0.96,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(height:12 ,),
                  Text(
                    'ANNUAL',
                    style: GoogleFonts.jost(
                      fontSize: 9.29,
                      fontWeight: FontWeight.w300,
                      color: const Color(0xFF2B2622),
                    ),
                  ),
                  Text(
                    '\$4.92',
                    style: GoogleFonts.jost(
                      fontSize: 26,
                      fontWeight: FontWeight.w300,
                      color: const Color(0xFF1B1916),
                    ),
                  ),
                  Text(
                    'per month · \$59/yr',
                    style: GoogleFonts.jost(
                      fontSize: 9,
                      color: const Color(0xFF9E9890),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const RadioDot(selected: true),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class RadioDot extends StatelessWidget {
  final bool selected;
  const RadioDot({super.key, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: selected
              ? const Color(0xFF7A6F66).withOpacity(0.24)
              : const Color(0xFF9C9890).withOpacity(0.24),
          width: 1.5,
        ),
      ),
      child: selected
          ? Center(
              child: Container(
                width: 9,
                height: 9,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFF2B2622),
                ),
              ),
            )
          : null,
    );
  }
}