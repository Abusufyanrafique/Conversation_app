import 'package:conversation_app/Utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UnlockBanner extends StatelessWidget {
  const UnlockBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: 346.03,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Color(0xFFEFE7DE), // #F4EFEA 18%
          borderRadius: BorderRadius.circular(15.87),    // radius 24px
          border: Border.all(
          color: Color(0xFFCFABA2).withOpacity(0.28), // #CFABA2 28%
          width: 1,
          ),
          boxShadow: [
            
           BoxShadow(
           color: const Color(0xFFFFFFFF).withOpacity(0.50),
           offset: const Offset(0, -1.5), 
           blurRadius: 0,
           spreadRadius: 1,
            ),
          BoxShadow(
          color: const Color(0xFFCFABA2).withOpacity(0.16),
          offset: const Offset(0, -10), 
          blurRadius: 40,
          spreadRadius: 0,
          ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Top Row: Heart icon + Title & Description ──
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 43,
                  height: 43,
                  decoration: BoxDecoration(
                    color: Color(0xFFCFA8A2).withOpacity(0.18),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: Color(0xFFCFA8A2).withOpacity(0.25),
                      width: 1,
                    ),
                  ),
                  child: Image(image: AssetImage(AppImages.blackheart)),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'There\'s ',
                              style: GoogleFonts.jost(
                                fontSize: 20,
                                color: Color(0xFF2B2622),
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            TextSpan(
                              text: 'more ',
                              style: GoogleFonts.jost(
                                fontSize: 20,
                                color: Color(0xFF7A6F66),
                                fontWeight: FontWeight.w300,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                            TextSpan(
                              text: 'waiting.',
                              style: GoogleFonts.jost(
                                fontSize: 20,
                                color: Color(0xFF2B2622),
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Ten more decks, personalized daily prompts, and the ability to save the questions that stay with you.',
                        style: GoogleFonts.jost(
                          fontSize: 10,
                          color: Color(0xFF7A6F66),
                          fontWeight: FontWeight.w400,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // ── Pill Bullets ──
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: const [
                _PillBullet(text: '10 more decks'),
                _PillBullet(text: 'Daily prompts'),
                _PillBullet(text: 'Save favourites'),
              ],
            ),
            const SizedBox(height: 16),

            // ── Bottom Row: Italic text + Unlock button ──
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Text(
                    'Some conversations only happen\nwhen you make space for them.',
                    style: GoogleFonts.jost(
                      fontSize: 11,
                      color: Color(0xFF7A6F66),
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
                      height: 1.5,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                SizedBox(
                  height: 38,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF2B2622),
                      elevation: 0,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    child: Row(children: [
                      Text(
                      'UNLOCK',
                      style: GoogleFonts.jost(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.1,
                      ),
                    ),
                    SizedBox(width: 4,),
                     Icon(
                      Icons.arrow_right_alt, 
                      size: 10, 
                      color:Colors.white,
                      ),
                    ],)
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PillBullet extends StatelessWidget {
  final String text;
  const _PillBullet({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Color(0xFFF4EFEA).withOpacity(0.18),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Color(0xFFCFA8A2).withOpacity(0.22),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 5,
            height: 5,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFCFA8A2),
            ),
          ),
          const SizedBox(width: 6),
          Text(
            text,
            style: GoogleFonts.jost(
              fontSize: 8.6,
              color: Color(0xFF7A6F66),
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}