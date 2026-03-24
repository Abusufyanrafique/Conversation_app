// MAIN BOTTOM SHEET
// ─────────────────────────────────────────
import 'package:conversation_app/Utils/app_images.dart';
import 'package:conversation_app/Utils/app_text.dart' as AppText;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GuestBottomSheet extends StatelessWidget {
  const GuestBottomSheet( {super.key});
 
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        color: Color(0xFFEFE7DE),
        borderRadius: BorderRadius.vertical(top: Radius.circular(52)),
      ),
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          _DragHandle(),
          SizedBox(height: 16),
          _HeaderSection(),
          SizedBox(height: 24),
          _InfoCard(
            imagepath: AppImages.blackheart,
            title: AppText.savedfavourites,
            subtitle: AppText.cardyoulove,
          ),
          SizedBox(height: 10),
          _InfoCard(
            imagepath:AppImages.daimondicon ,
            title: AppText.nopurchaserestore,
            subtitle: AppText.decks,
          ),
          SizedBox(height: 10),
          _InfoCard(
            imagepath:AppImages.arrowdiamond,
            title: AppText.twofreedecks,
            subtitle: AppText.youcanexplore,
          ),
          SizedBox(height: 28),
          _ContinueAsGuestButton(),
          SizedBox(height: 12),
          _CreateAccountButton(),
        ],
      ),
    );
  }
}
 
// ─────────────────────────────────────────
// DRAG HANDLE
// ─────────────────────────────────────────
class _DragHandle extends StatelessWidget {
  const _DragHandle();
 
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 40,
        height: 4,
        decoration: BoxDecoration(
          color: Color(0xFF9C9590).withOpacity(0.3),
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }
}
 
// ─────────────────────────────────────────
// HEADER SECTION
// ─────────────────────────────────────────
class _HeaderSection extends StatelessWidget {
  const _HeaderSection();
 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Circle icon (target/bullseye)
        
          Image(image: AssetImage(AppImages.cricle)),
        
        const SizedBox(height: 16),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: const TextStyle(
              fontSize: 26,
              color: Color(0xFF3B2E28),
              height: 1.3,
            ),
            children: [
               TextSpan(text: AppText.exploring,
                style: GoogleFonts.jost(
              fontSize: 30,
              fontWeight: FontWeight.w400,
              letterSpacing: 1.54,
              color: const Color(0xFF2B2622),
            ),
              ),
              TextSpan(
                text: 'a ',
                style: GoogleFonts.jost(
              fontSize: 30,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF2B2622),
            ),
              ),
              TextSpan(
                text: AppText.guest,
              style: GoogleFonts.jost(
              fontSize: 30,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF7A6F66),
            ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text(
          AppText.youarewelcome,
          textAlign: TextAlign.center,
         style: GoogleFonts.jost(
              fontSize: 15,
              fontWeight: FontWeight.w300,
              fontStyle: FontStyle.italic,
              color: const Color(0xFF7A6F66),
            ),
        ),
      ],
    );
  }
}
 
// ─────────────────────────────────────────
// INFO CARD
// ─────────────────────────────────────────
class _InfoCard extends StatelessWidget {
  final String imagepath;
  final String title;
  final String subtitle;
 
  const _InfoCard({
    
    required this.title,
    required this.subtitle, 
    required this.imagepath,
  });
 
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF4EFEA).withOpacity(0.01),
        borderRadius: BorderRadius.circular(15.86),
        border: Border.all(
          color: Colors.white,
          width: 1,
          ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon box
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: const Color(0xFF7A6F66).withOpacity(0.40),
                borderRadius: BorderRadius.circular(10),
              ),
              child:Image(image: AssetImage(imagepath)),
            ),
          ),
          const SizedBox(width: 12),
          // Text
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
              style: GoogleFonts.jost(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF2B2622),
            ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
              style: GoogleFonts.jost(
              fontSize: 11,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF9C9590),
            ),
                ),
              ],
            ),
          ),
          // Close icon
          Padding(
            padding: const EdgeInsets.only(top: 16.0,left: 5),
            child: Icon(
              Icons.close, size: 22, 
              color: Color(0xFF7A6F66)),
          ),
        ],
      ),
    );
  }
}
 
// ─────────────────────────────────────────
// CONTINUE AS GUEST BUTTON
// ─────────────────────────────────────────
class _ContinueAsGuestButton extends StatelessWidget {
  const _ContinueAsGuestButton();
 
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 53,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF2B2622),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        side: BorderSide(
        color: Colors.white,  
        width: 1.5,
      ),
          elevation: 0,
        ),
        child:  Text(
          AppText.contiuneguest,
          style: GoogleFonts.jost(
              fontSize: 11,
              letterSpacing: 0.55,
              fontWeight: FontWeight.w400,
              color: const Color(0xFFEFE7DE),
            ),
        ),
      ),
    );
  }
}
 
// ─────────────────────────────────────────
// CREATE ACCOUNT BUTTON
// ─────────────────────────────────────────
class _CreateAccountButton extends StatelessWidget {
  const _CreateAccountButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white),
      ),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor:const Color(0xFFF4EFEA).withOpacity(0.01) ,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child:  Text(
          'Create a free account instead',
           style: GoogleFonts.jost(
              fontSize: 12,
              letterSpacing: 0.55,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF2B2622),
            ),
        ),
      ),
    );
  }
}