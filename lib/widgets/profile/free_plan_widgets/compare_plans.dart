import 'package:conversation_app/Utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ComparePlans extends StatelessWidget {
  const ComparePlans({super.key});

  @override
  Widget build(BuildContext context) {
    final features = [
      '2 free decks',
      'Daily question',
      '12 deck library',
      'Personal prompts',
      'Save favourites',
      'Streak tracking',
    ];
    final freeIncluded = [true, true, false, false, false, false];
    final premiumIncluded = [true, true, true, true, true, true];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ─── FREE CARD ───
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFEFE7DE),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.white, width: 1),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Free',
                  style: GoogleFonts.jost(
                    fontSize: 19.88,
                    fontWeight: FontWeight.w300,
                    color: const Color(0xFF1B1916),
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '\$0',
                        style: GoogleFonts.jost(
                          fontSize: 23,
                          fontWeight: FontWeight.w300,
                          color: const Color(0xFF1B1916),
                        ),
                      ),
                      TextSpan(
                        text: ' / mo',
                        style: GoogleFonts.jost(
                          fontSize: 8.58,
                          color: const Color(0xFF9E9890),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                // CURRENT Badge
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF9C9890).withOpacity(0.12),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Color(0xFF9C9890).withOpacity(0.20),
                      width: 0.9,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image(
                        image: AssetImage("assets/icons/authentication/blurcricle.png"),
                        width: 8,
                        height: 8,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'CURRENT',
                        style: GoogleFonts.jost(
                          fontSize: 8.13,
                          color: const Color(0xFF9C9890),
                          letterSpacing: 0.98,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                // Separator line
                const SizedBox(height: 10),
                Container(
                  height: 0.9,
                  color: Color(0xFF9C9890).withOpacity(0.14),
                ),
                const SizedBox(height: 10),
                ...List.generate(
                  features.length,
                  (i) => FeatureRow(
                    label: features[i],
                    included: freeIncluded[i],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 12),
        // ─── PREMIUM CARD ───
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFE0D5CB),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: const Color(0xFF7A6F66).withOpacity(0.40),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Premium',
                  style: GoogleFonts.jost(
                    fontSize: 19.75,
                    fontWeight: FontWeight.w300,
                    color: const Color(0xFF7A6F66),
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '\$4.92',
                        style: GoogleFonts.jost(
                          fontSize: 23,
                          fontWeight: FontWeight.w300,
                          color: const Color(0xFF1B1916),
                        ),
                      ),
                      TextSpan(
                        text: ' / mo',
                        style: GoogleFonts.jost(
                          fontSize: 8.58,
                          color: const Color(0xFF9E9890),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                // MOST POPULAR Badge
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFF7A6F66).withOpacity(0.20),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '★ MOST POPULAR',
                    style: GoogleFonts.jost(
                      fontSize: 7.81,
                      color: const Color(0xFF7A6F66),
                      letterSpacing: 0.97,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                // Separator line
                const SizedBox(height: 10),
                Container(
                  height: 0.9,
                  color: Color(0xFF9C9890).withOpacity(0.14),
                ),
                const SizedBox(height: 10),
                ...List.generate(
                  features.length,
                  (i) => FeatureRow(
                    label: features[i],
                    included: premiumIncluded[i],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class FeatureRow extends StatelessWidget {
  final String label;
  final bool included;
  const FeatureRow({
    super.key,
    required this.label,
    required this.included,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Container(
            height: 14.48,
            width: 14.48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.52),
              color: included
                  ? Colors.transparent
                  : const Color(0xFF9C9890).withOpacity(0.10),
              border: Border.all(
                color: included
                    ? const Color(0xFF7A6F66)
                    : const Color(0xFF9C9890).withOpacity(0.35),
                width: 1,
              ),
            ),
            child: Icon(
              included ? Icons.check : Icons.remove,
              size: 10,
              color: included
                  ? const Color(0xFF7A6F66)
                  : const Color(0xFF9C9890).withOpacity(0.50),
            ),
          ),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              label,
              style: GoogleFonts.jost(
                fontSize: 8.41,
                color: included
                    ? const Color(0xFF2B2622)
                    : const Color(0xFF9E9890),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}