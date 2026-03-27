import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CurrentPlanCard extends StatelessWidget {
  const CurrentPlanCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFF4EFEA).withOpacity(0.01),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color:  Colors.white,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'YOUR CURRENT PLAN',
            style: GoogleFonts.jost(
              fontSize: 9.23,
              color: const Color(0xFF7A6F66),
              letterSpacing: 2.03,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Free ',
                      style: GoogleFonts.jost(
                        fontSize: 26,
                        fontWeight: FontWeight.w300,
                        color: const Color(0xFF2B2622),
                      ),
                    ),
                    TextSpan(
                      text: 'Plan.',
                      style: GoogleFonts.jost(
                        fontSize: 26,
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic,
                        color: const Color(0xFF7A6F66),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15, 
                  vertical: 4
                  ),
                decoration: BoxDecoration(
                  color: const Color(0xFF9C9890).withOpacity(0.12),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0xFF9C9890).withOpacity(0.22),
                    width: 1,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF7A6F66),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'ACTIVE',
                      style: GoogleFonts.jost(
                        fontSize: 8,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF7A6F66),
                        letterSpacing: 1.17,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              PlanDetail(label: 'PRICE', value: '\$0 / month'),
              const SizedBox(width: 32),
              PlanDetail(label: 'DECKS UNLOCKED', value: '2 of 12'),
            ],
          ),
          const SizedBox(height: 12),
          PlanDetail(label: 'PERSONAL PROMPTS', value: 'Not included'),
        ],
      ),
    );
  }
}

class PlanDetail extends StatelessWidget {
  final String label;
  final String value;
  const PlanDetail({
    super.key, 
    required this.label, 
    required this.value
    });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.jost(
            fontSize: 8,
            color: const Color(0xFF9E9890),
            letterSpacing: 1.4,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          value,
          style: GoogleFonts.jost(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.italic,
            color: const Color(0xFF7A6F66),
          ),
        ),
      ],
    );
  }
}