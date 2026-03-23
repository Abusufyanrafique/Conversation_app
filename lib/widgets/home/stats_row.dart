import 'package:conversation_app/Utils/app_colors.dart';
import 'package:conversation_app/providers/home/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StatsRow extends StatelessWidget {
  const StatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final stats = context.watch<HomeProvider>().stats;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: stats
            .asMap()
            .entries
            .map((entry) {
              final isLast = entry.key == stats.length - 1;
              return Expanded(
                child: Row(
                  children: [
                    Expanded(child: _StatTile(stat: entry.value)),
                    if (!isLast)
                      Container(
                        width: 1,
                        height: 36,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        // color: AppColors.divider,
                      ),
                  ],
                ),
              );
            })
            .toList(),
      ),
    );
  }
}

class _StatTile extends StatelessWidget {
  final dynamic stat;
  const _StatTile({required this.stat});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.savebtncolor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: Colors.white,
          width: 0.96
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            stat.value,
             style: GoogleFonts.jost(
                 fontSize:18.89,
                 color:AppColors.cardnumbers,
                 fontWeight: FontWeight.w300,
                
                        ),
          ),
          const SizedBox(height: 2),
          Text(
            stat.label,
            style: GoogleFonts.jost(
            fontSize:8.5,
            letterSpacing: 1.26,
            color:AppColors.countcardtextcolor,
            fontWeight: FontWeight.w400,
                
                        ),
          ),
          const SizedBox(height: 1),
          Text(
            stat.sublabel,
            style: GoogleFonts.jost(
            fontSize:8.5,
            letterSpacing: 1.26,
            color:AppColors.countcardtextcolor,
            fontWeight: FontWeight.w400,
                
                        ),
          ),
        ],
      ),
    );
  }
}