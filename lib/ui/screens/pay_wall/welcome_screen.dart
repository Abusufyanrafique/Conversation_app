import 'package:conversation_app/Utils/app_images.dart';
import 'package:conversation_app/Utils/app_text.dart' as AppText;
import 'package:conversation_app/ui/screens/pay_wall/user_type_screen.dart';
import 'package:conversation_app/widgets/card_interaction/begin_button.dart';
import 'package:conversation_app/widgets/card_interaction/container_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFE7DE),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               SizedBox(height: 50,),
                // Cards placeholder (empty space)
                 Stack(
                     alignment: Alignment.center,
                     children: [
                // Card 4 — sabse peeche
                ContainerCard(
                  width: 185,
                  height: 220,
                  angle: -22,
                  x: -20,
                  y: 8,
                  color: const Color(0xFFE2D1CC),
                  shadowColor: const Color(0xFFEFE4DF),
                ),
            
                // Card 3 — right side
                ContainerCard(
                  width: 180,
                  height: 220,
                  angle: -10,
                  x: -12,
                  y: -6,
                  color: const Color(0xFFE3D0CB),
                ),
            
                // Card 2 — halka left
                ContainerCard(
                  width: 180,
                  height: 220,
                  angle: -15,
                  x: -10,
                  y: -6,
                  color: const Color(0xFFD0D6CD).withOpacity(0.7), 
                ),
            
                // Card 1 — sabse aage
                ContainerCard(
                  width: 180,
                  height: 220,
                  angle: -3,
                  x: -1,
                  y: -17,
                  color: Color(0xFFC59D97),
                  child: Column(
                    children: [
                      SizedBox(height: 80,),
                    Image(image: AssetImage(AppImages.couples)),
                    SizedBox(height: 12,),
                    Center(
                    child: Image(
                      image:AssetImage(
                      AppImages.finallogo)),
                  ),
                  ],)
                ),
              ],
            ),   
                const SizedBox(height:60),
            
                // Brand name
                Text(
                  AppText.collection,
                   style: GoogleFonts.jost(
                          fontSize:10,
                           color: Color(0xFFA09890),
                           fontWeight: FontWeight.w300,
                           letterSpacing: 3.08,
                      ),
                  textAlign: TextAlign.center,
                ),
            
                const SizedBox(height: 8),
            
                // Main heading
               RichText(
               textAlign: TextAlign.center,
               text: TextSpan(
               children: [
               TextSpan(
               text:AppText.questionworth,
               style: GoogleFonts.jost(
               fontSize:42,
               color: Color(0xFF2B2622),
                fontStyle: FontStyle.italic,
               fontWeight: FontWeight.w300,
              
                      ),
      ),
      TextSpan(
        text: AppText.sittingwith,
        style: GoogleFonts.jost(
        fontSize:42,
        color: Color(0xFF7A6F66),
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w300,
               height:0.8,
                      ),
      ),
    ],
  ),
),
            
                const SizedBox(height:24),
            
                // Subtitle
                Text(
                  AppText.littledeeper,
                  style: GoogleFonts.jost(
                    fontSize: 16,
                    color: const Color(0xFF7A6F66),
                    fontWeight: FontWeight.w300,
                    // height:2,
                  ),
                  textAlign: TextAlign.center,
                ),
            
                // const Spacer(flex: 1),
                SizedBox(height:30,),
                BeginButton(
                  text: ' BEGIN → ',
                  onTap: () { 
                    Navigator.push(
                   context,
                   MaterialPageRoute(
                   builder: (context) => const UserTypeScreen()
                  ),
                 );
                   },
                  ),
                  SizedBox(height:15,),
                // Already have account
                TextButton(
                  onPressed: () {},
                  child: Text(
                  AppText.alreadyhaveaccount,
                    style: GoogleFonts.jost(
                      fontSize: 11.5,
                      letterSpacing:1.61,
                      color: const Color(0xFF7A6F66),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
            
                const SizedBox(height:8),
            
                // Terms text
                Text(
               AppText.privacypolicy,
                  style: GoogleFonts.jost(
                    fontSize: 10,
                    letterSpacing: 0.4,
                    color: const Color(0xFFA09890),
                    fontWeight: FontWeight.w300
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}