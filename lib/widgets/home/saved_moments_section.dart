import 'package:conversation_app/providers/home/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SavedMomentsSection extends StatelessWidget {
  const SavedMomentsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final moments = context.watch<HomeProvider>().savedMoments;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Row(children: [
            Text(
            'SAVED MOMENTS',
           style: GoogleFonts.jost(
                 fontSize:9.2,
                 color:Color(0xFF9E9890),
                 letterSpacing: 2.8,
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
          SizedBox(
            height: 120,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: moments.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                return _MomentCard(quote: moments[index].quote);
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
  const _MomentCard({required this.quote});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.6;

    return Container(
      width: width,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color:Color(0xFFF4EFEA).withOpacity(0.01),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Colors.white
          ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            quote,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12,
              // color: AppColors.textMedium,
              fontFamily: 'Playfair Display',
              height: 1.45,
              fontStyle: FontStyle.italic,
            ),
          ),
          // const Icon(Icons.favorite, size: 14, color: AppColors.cardBrown),
        ],
      ),
    );
  }
}