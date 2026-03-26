import 'dart:ui';
import 'package:conversation_app/providers/home/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SavedMomentsSection extends StatelessWidget {
  const SavedMomentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();
    final moments = provider.savedMoments;
    final isLocked = !provider.isPremiumView;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
        const    SizedBox(height: 24,),
            Text(
              'SAVED MOMENTS',
              style: GoogleFonts.jost(
                fontSize: 9.2,
                color: const Color(0xFF9E9890),
                letterSpacing: 2.8,
                fontWeight: FontWeight.w400,
              ),
            ),
          const  SizedBox(width: 9,),
            Expanded(
              child: Container(
                height: 0.98,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0x2E9E9890),
                      Color(0x009E9890),
                    ],
                  ),
                ),
              ),
            ),
          ]),
          const SizedBox(height: 22),
          SizedBox(
            height: 130,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              clipBehavior: Clip.none,
              itemCount: moments.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                return _MomentCard(
                  quote: moments[index].quote,
                  isLocked: isLocked,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _MomentCard extends StatelessWidget {
  final String quote;
  final bool isLocked;
  const _MomentCard({required this.quote, required this.isLocked});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.6;
    const height = 125.0;

    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // ── Card content ──
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF0EBE3),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: Colors.white,
                width: 1.8,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.09),
                  blurRadius: 4,
                  spreadRadius: 1,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // ── Vertical accent line ──
                  Container(
                    width: 3.5,
                    decoration: const BoxDecoration(
                      color: Color(0xFF7A6F66),
                      
                    ),
                  ),
                  // ── Text content ──
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 10, 14, 14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // ── INTIMACY label — locked ho tab bhi visible ──
                          Text(
                            'INTIMACY',
                            style: GoogleFonts.jost(
                              fontSize: 9.0,
                              color: const Color(0xFF9E9890),
                              letterSpacing: 2.5,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 6),
                          // ── Quote — sirf yeh blur hoga ──
                          Expanded(
                            child: isLocked
                                ? ImageFiltered(
                                    imageFilter: ImageFilter.blur(
                                      sigmaX: 4.5,
                                      sigmaY: 4.5,
                                      tileMode: TileMode.decal,
                                    ),
                                    child: Text(
                                    quote,
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.cormorantGaramond(
                                    fontSize: 14,
                                    fontStyle: FontStyle.italic,
                                    color: const Color(0xFF1E1B18),
),
                                  ),
                                  )
                                : Text(
                                    quote,
                                    maxLines: 4,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.cormorantGaramond(
                                    fontSize: 14,
                                    fontStyle: FontStyle.italic,
                                    color: const Color(0xFF1E1B18),
),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ── Lock icon only — no overlay ──
          if (isLocked)
            Positioned(
              bottom: 60,
              right: 100,
              child: Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFF4EFEA).withOpacity(0.92),
                  border: Border.all(color: Colors.white),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: Image.asset(
                    "assets/icons/authentication/lock.png",
                    width: 13,
                    height: 13,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}