import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PremiumCurrentPlanCard extends StatelessWidget {
  const PremiumCurrentPlanCard({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final isSmall = w < 360;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isSmall ? 10 : 14),
      decoration: BoxDecoration(
        color: Color(0xFFF4EFEA).withOpacity(0.01),
        borderRadius: BorderRadius.circular(15.27),
        border: Border.all(color: Colors.white, width: 1.02),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'YOUR CURRENT PLAN',
            style: GoogleFonts.jost(
              fontSize: 9.23,
              fontWeight: FontWeight.w400,
              letterSpacing: 2.03,
              color: const Color(0xFF2B2622),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Premium ',
                      style: GoogleFonts.jost(
                        fontSize: 27.17,
                        fontWeight: FontWeight.w300,
                        color: const Color(0xFF2B2622),
                      ),
                    ),
                    TextSpan(
                      text: 'Plan.',
                      style: GoogleFonts.jost(
                        fontSize: 27.17,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w300,
                        color: const Color(0xFF7A6F66),
                      ),
                    ),
                  ],
                ),
              ),
              const _ActiveBadge(),
            ],
          ),
          const SizedBox(height: 16),
          _PlanInfoRow(isSmall: isSmall),
          const SizedBox(height: 12),
          const _PersonalPromptsRow(),
        ],
      ),
    );
  }
}

class _ActiveBadge extends StatelessWidget {
  const _ActiveBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
          const Icon(Icons.circle, size: 8, color: Color(0xFF7A6F66)),
          const SizedBox(width: 3),
          Text(
            'ACTIVE',
            style: GoogleFonts.jost(
              fontSize: 9.03,
              fontWeight: FontWeight.w400,
              letterSpacing: 1.17,
              color: const Color(0xFF7A6F66),
            ),
          ),
        ],
      ),
    );
  }
}

class _PlanInfoRow extends StatelessWidget {
  final bool isSmall;
  const _PlanInfoRow({this.isSmall = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _InfoColumn(label: 'BILLING', value: '\$59 / year', isBilling: true), 
        SizedBox(width: isSmall ? 14 : 18),
        _InfoColumn(label: 'DECKS UNLOCKED', value: 'All 12'),                
        SizedBox(width: isSmall ? 14 : 18),
        _InfoColumn(label: 'NEXT RENEWAL', value: 'March 23, 2026'),          
      ],
    );
  }
}

class _InfoColumn extends StatelessWidget {
  final String label;
  final String value;
  final bool isBilling;

  const _InfoColumn({
    required this.label,
    required this.value,
    this.isBilling = false,
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
            fontWeight: FontWeight.w400,
            letterSpacing: 1.04,
            color: const Color(0xFF7A6F66),
          ),
        ),
        const SizedBox(height: 3),
        isBilling
            ? RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '\$',
                      style: GoogleFonts.jost(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                        letterSpacing: 1,
                        color: const Color(0xFF7A6F66),
                      ),
                    ),
                    TextSpan(
                      text: '59',
                      style: GoogleFonts.jost(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                        letterSpacing: 1,
                        color: const Color(0xFF7A6F66),
                      ),
                    ),
                    TextSpan(
                      text: ' / year',
                      style: GoogleFonts.jost(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                        letterSpacing: 0.8,
                        color: const Color(0xFF7A6F66),
                      ),
                    ),
                  ],
                ),
              )
            : Text(
                value,
                style: GoogleFonts.jost(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic,
                  letterSpacing: 1.04,
                  color: const Color(0xFF7A6F66),
                ),
              ),
      ],
    );
  }
}

class _PersonalPromptsRow extends StatelessWidget {
  const _PersonalPromptsRow();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'PERSONAL PROMPTS',
          style: GoogleFonts.jost(
            fontSize: 8,
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.italic,
            letterSpacing: 1.4,
            color: const Color(0xFF9C9890),
          ),
        ),
        const SizedBox(height: 3),
        Text(
          'Included',
          style: GoogleFonts.jost(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            fontStyle: FontStyle.italic,
            color: const Color(0xFF7A6F66),
          ),
        ),
      ],
    );
  }
}