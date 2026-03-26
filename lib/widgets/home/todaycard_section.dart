import 'package:conversation_app/Utils/app_colors.dart';
import 'package:conversation_app/providers/home/home_provider.dart';
import 'package:conversation_app/widgets/home/save_moment_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class TodayCardSection extends StatelessWidget {
  const TodayCardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Row(children: [
           Text(
            'TODAY\'S CARD', 
           style: GoogleFonts.jost(
                 letterSpacing: 2.8,
                 fontSize:10,
                 color:AppColors.todaycard,
                 fontWeight: FontWeight.w400,
                
                        ),
          
          ),
          SizedBox(width: 9,),
           Expanded(
            child: Container(
              height: 0.98,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0x2E9E9890), // #9E98902E - 18% opacity
                    Color(0x009E9890), // #9E989000 - 0% opacity
                  ],
                ),
              ),
            ),
          ),
         ],),
          const SizedBox(height: 12),
          const _CardWidget(),
          const SizedBox(height: 31.69),
          const _DrawAnotherButton(),
          const SizedBox(height: 11),
          const _SaveRow(),
        ],
      ),
    );
  }
}

// ── Main Card ───────────────────────────────────────────
class _CardWidget extends StatelessWidget {
  const _CardWidget();

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();
    final card = provider.todayCard;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.homebrownbigcard,
        borderRadius: BorderRadius.circular(15.87),
        border: Border.all(
          color: Colors.white,
          width: 1.02,
        ),
       
      boxShadow: [
  BoxShadow(
    color: const Color(0xFFBA8982),
    blurRadius: 10,
    spreadRadius: 0,
    offset: const Offset(0, 6), // ← sirf bottom mein shadow
  ),
],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top row: label + tag
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: .0),
                child: Text(
                  'NEW CARD EVERYDAY',
                   style: GoogleFonts.jost(
                   fontSize:12,
                   letterSpacing: 1,
                   color:Color(0xFFEFE7DE),
                   fontWeight: FontWeight.w300,
                  
                          ),
                ),
              ),
              _TagChip(label: card.tag),
            ],
          ),
          const SizedBox(height: 14),

          // Decorative dash
          Container(
            width: 24,
            height: 2,
            color: AppColors.white.withOpacity(0.5),
          ),
          const SizedBox(height: 16),
     //    ===============card text ===============
          // Quote
          Padding(
            padding: const EdgeInsets.only(left: 6.0),
            child: Text(
              card.quote,
              style:TextStyle(
                color: Colors.white,
                height: 0.9,
                fontSize: 38,
                fontFamily:"PeachBlue",
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Bottom row: draw label + heart
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white.withOpacity(0.7),
  ),
),
                  const SizedBox(width: 5),
                  Text(
                    'DRAW TODAY\'S CARD',
                   style: GoogleFonts.jost(
                   fontSize:9,
                   letterSpacing: 1,
                   color:Color(0xFFEFE7DE),
                   fontWeight: FontWeight.w300,
                  
                          ),
                  ),
                ],
              ),
              _HeartButton(isSaved: card.isSaved),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Tag Chip ────────────────────────────────────────────
class _TagChip extends StatelessWidget {
  final String label;
  const _TagChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 3),
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(0.16),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withOpacity(0.20),
          width: 0.96
        )
      ),
      child: Text(
        '● $label',
       style: GoogleFonts.jost(
                   fontSize:9,
                   letterSpacing: 1,
                   color:Colors.white,
                   fontWeight: FontWeight.w400,
                  
                          ),
      ),
    );
  }
}

// ── Heart Button ────────────────────────────────────────
class _HeartButton extends StatelessWidget {
  final bool isSaved;
  const _HeartButton({required this.isSaved});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<HomeProvider>().toggleSaved(),
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
         color: Colors.white.withOpacity(0.16),
          borderRadius: BorderRadius.circular(9.68),
          border: Border.all(color: AppColors.white.withOpacity(0.3)),
        ),
        child: Icon(
          isSaved ? Icons.favorite : Icons.favorite_border,
          color: AppColors.white,
          size: 18,
        ),
      ),
    );
  }
}

// ── Draw Another Button ─────────────────────────────────
class _DrawAnotherButton extends StatelessWidget {
  const _DrawAnotherButton();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width:300,
        height: 45,
        child: ElevatedButton(
          onPressed: () => context.read<HomeProvider>().drawAnother(),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.homedrawbtncolor,       
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          child:  Text(
            'DRAW ANOTHER',
            style: GoogleFonts.jost(
                   fontSize:9.26,
                   color:AppColors.btntextcolor,
                   letterSpacing: 1.67,
                   fontWeight: FontWeight.w300,
                  
                          ),
          ),
        ),
      ),
    );
  }
}

// ── Save Row ────────────────────────────────────────────
class _SaveRow extends StatelessWidget {
  const _SaveRow();

  @override
  Widget build(BuildContext context) {
    final isSaved = context.watch<HomeProvider>().todayCard.isSaved;

    return Padding(
      padding: const EdgeInsets.only(left: 10.0,right: 10),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => context.read<HomeProvider>().toggleSaved(),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.50,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.savebtncolor,
                  borderRadius: BorderRadius.circular(11.82),
                  border: Border.all(
                    color: AppColors.white,
                    width: 0.75                  
                    ),
                  
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      isSaved ? 'SAVED TO FAVORITES' : 'SAVE TO FAVORITES',
                      style: GoogleFonts.jost(
                     fontSize:8.87,
                     color:AppColors.savetextbtncolor,
                     letterSpacing: 1.42,
                     fontWeight: FontWeight.w400,
                    
                            ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      isSaved ? Icons.favorite : Icons.favorite_border,
                      size: 8,
                      color:Color(0xFF2B2622),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 6),
          InkWell(
            onTap: () {
              showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (_) => const SaveMomentBottomSheet(),
      );
            },
            child: Container(
              width: 38,
              height: 39,
              decoration: BoxDecoration(
                color: AppColors.savebtncolor,
                borderRadius: BorderRadius.circular(9.29),
                border: Border.all(
                  color: AppColors.white,
                  width: 0.59,           
                  ),
              ),
              child: const Icon(
                Icons.ios_share, size: 18, 
                color: AppColors.shareiconcolor
                ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── local import fix ─────────────────────────────────────
class AppTextStyles {
  static const sectionTitle = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    // color: AppColors.textLight,
    letterSpacing: 1.2,
  );
  static const cardQuote = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    // color: AppColors.white,
    fontFamily: 'Playfair Display',
    height: 1.45,
  );
  static const outlineButtonLabel = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    // color: AppColors.textDark,
    letterSpacing: 1.2,
  );
}