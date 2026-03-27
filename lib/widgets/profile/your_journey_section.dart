import 'package:conversation_app/Utils/app_images.dart';
import 'package:conversation_app/providers/profile/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class YourJourneySection extends StatelessWidget {
  const YourJourneySection({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 23.94,),
       Row(
        children: [
          Text(
          'YOUR JOURNEY',
          style: GoogleFonts.jost(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            letterSpacing: 2.28,
            color: const Color(0xFF7A6F66),
          ),
        ),
         Expanded(
                     child: Container(
                      width: 206,
                       height: 0.98,
                       decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color(0xFF9E9890).withOpacity(0.2),
                          Color(0xFF9E9890).withOpacity(0.02),
                        ])
                       ),
                     ),
                   ),
       ],),
        const SizedBox(height: 24),
        Row(
          children: [
            _JourneyStat(
              imagepath: AppImages.smallblackcricle,
              value: '${user.decksCompleted}',
              label: 'DECKS\nCOMPLETED',
            ),
            const SizedBox(width: 10),
            _JourneyStat(
              imagepath: AppImages.smallblackcricle,
              value: '${user.cardsExplored}',
              label: 'CARDS\nEXPLORED',
            ),
            const SizedBox(width: 10),
            _JourneyStat(
            imagepath: AppImages.smallblackheart,
              value: '${user.questionsSaved}',
              label: 'QUESTIONS\nSAVED',
            ),
          ],
        ),
      ],
    );
  }
}

class _JourneyStat extends StatelessWidget {
  final String imagepath; 
  final String value;
  final String label;

  const _JourneyStat({   
    required this.value,
    required this.label, 
    required this.imagepath,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20
          ),
        decoration: BoxDecoration(
          color: const Color(0xFFF4EFEA).withOpacity(0.01),
          borderRadius: BorderRadius.circular(14.19),
          border: Border.all(
            color: Colors.white, 
            width: 1,
            ),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: Color(0xFFAABBA4).withOpacity(0.20),
                  borderRadius: BorderRadius.circular(11.15),
                  border: Border.all(
                    color: Color(0xFFAABBA4).withOpacity(0.26),
                    width: 0.98,
                  )
                ),
                child:Image(
                  image: AssetImage(imagepath)),),
              const SizedBox(height: 8),
              Text(
                value,
                style: GoogleFonts.jost(
                  fontSize: 32,
                  fontWeight: FontWeight.w300,
                  color: const Color(0xFF1C1A17),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                label,
                style: GoogleFonts.jost(
                  fontSize: 8.37,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.17,
                  color: const Color(0xFF9D9890),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}