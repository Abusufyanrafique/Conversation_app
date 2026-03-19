import 'package:conversation_app/Utils/app_images.dart';
import 'package:conversation_app/Utils/app_text.dart' as AppText;
import 'package:conversation_app/providers/authentication/auth_see_you_screen_provider.dart';
import 'package:conversation_app/ui/screens/authentication/begin_your_story_screen.dart';
import 'package:conversation_app/widgets/authentication/auth_screen_row.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CheckYourEmailScreen extends StatelessWidget {
  const CheckYourEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final auth = context.watch<AuthSeeYouScreenProvider>();
    final size = MediaQuery.of(context).size;
    final h = size.height;

    // Screen height breakpoints
    final isSmall  = h < 680;   // iPhone SE, small Android
    final isMedium = h < 800;   // normal phones

    // Responsive spacing — shrinks on smaller screens
    double sp(double val) {
      if (isSmall)  return val * 0.45;
      if (isMedium) return val * 0.72;
      return val;
    }

    // Responsive title font size
    double titleSize() {
      if (isSmall)  return 36;
      if (isMedium) return 42;
      return 48;
    }

    return Scaffold(
      backgroundColor: const Color(0xFFEFE7DE),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(left: 10,right: 10,),
          padding: const EdgeInsets.symmetric(horizontal:20),
          decoration: BoxDecoration(
          color: const Color(0xFFEFE7DE),
          ),
          child: GestureDetector(
            onTap: () {
             Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BeginYourStoryScreen()),
                 );  
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(height: 37.07,),
              AuthScreenRow(
               imagePath: AppImages.foucsarrow,
               text: AppText.resetpassword,
               onTap: () {},
                ),
                SizedBox(height: 48,),
                Center(
                  child: Container(
                    height: 61,
                    width: 61,
                    decoration: BoxDecoration(
                      color: Color(0xFFEFE7DE),
                      borderRadius: BorderRadius.all(Radius.circular(15.87)),
                      border: Border.all(
                        color: Colors.white,
                        width: 1.06
                      )
                    ),
                    child: Image(
                      image: AssetImage(AppImages.email)),
                  ),
                ),
                SizedBox(height: 14,),
                Center(
                  child: Text(AppText.checkyour,
                   style: GoogleFonts.jost(
                    fontSize: 30,
                    color: const Color(0xFF2B2622),
                    letterSpacing: 0.96,
                     fontWeight: FontWeight.w300,
                        ),
                  ),
                ),
                Center(
                  child: Text(AppText.email1,
                   style: GoogleFonts.jost(
                   fontSize: 30,
                   color: const Color(0xFF7A6F66),
                   letterSpacing: 0.96,
                     fontStyle: FontStyle.italic,
                   fontWeight: FontWeight.w300,
                        ),
                  ),
                ),
                Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    AppText.arrive,          
                    style: GoogleFonts.jost(                   
                    fontSize: 14,
                    
                    color: const Color(0xFF2B2622),
                    fontWeight: FontWeight.w300,
                        ),
                  ),
                ),
                SizedBox(height:82,),
                Center(child: Image(image: AssetImage(AppImages.flowerimage))),
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}