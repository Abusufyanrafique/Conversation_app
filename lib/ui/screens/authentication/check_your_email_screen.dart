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

    final isSmall  = h < 680;
    final isMedium = h < 800;

    double sp(double val) {
      if (isSmall)  return val * 0.45;
      if (isMedium) return val * 0.72;
      return val;
    }

    double titleSize() {
      if (isSmall)  return 22;   // 36 → 22
      if (isMedium) return 26;   // 42 → 26
      return 30;
    }

    return Scaffold(
      backgroundColor: const Color(0xFFEFE7DE),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: const BoxDecoration(
            color: Color(0xFFEFE7DE),
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BeginYourStoryScreen(),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(height: sp(37)),           // was: 37.07
                AuthScreenRow(
                  imagePath: AppImages.foucsarrow,
                  text: AppText.resetpassword,
                  onTap: () {},
                ),
                SizedBox(height: sp(48)),           // was: 48
                Center(
                  child: Container(
                    height: isSmall ? 48 : 61,      // was: fixed 61
                    width:  isSmall ? 48 : 61,      // was: fixed 61
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFE7DE),
                      borderRadius: BorderRadius.all(Radius.circular(15.87)),
                      border: Border.all(
                        color: Colors.white,
                        width: 1.06,
                      ),
                    ),
                    child: Image(
                      image: AssetImage(AppImages.email),
                    ),
                  ),
                ),
                SizedBox(height: sp(14)),           // was: 14
                Center(
                  child: Text(
                    AppText.checkyour,
                    style: GoogleFonts.jost(
                      fontSize: titleSize(),
                      color: const Color(0xFF2B2622),
                      letterSpacing: 0.96,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    AppText.email1,
                    style: GoogleFonts.jost(
                      fontSize: titleSize(),
                      color: const Color(0xFF7A6F66),
                      letterSpacing: 0.96,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                SizedBox(height: sp(8)),
                Center(
                  child: Text(
                    AppText.arrive,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.jost(
                      fontSize: isSmall ? 12 : 14,  // was: fixed 14
                      color: const Color(0xFF2B2622),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                SizedBox(height: sp(82)),           // was: 82 — bara culprit
                Center(
                  child: Image(
                    image: AssetImage(AppImages.flowerimage),
                    height: isSmall ? 160 : null,   // shrink image on small screens
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}