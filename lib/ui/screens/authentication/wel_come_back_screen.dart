import 'package:conversation_app/Utils/app_images.dart';
import 'package:conversation_app/Utils/app_text.dart' as AppText;
import 'package:conversation_app/ui/screens/authentication/restore_your_collection_screen.dart';
import 'package:conversation_app/widgets/authentication/auth_header_section.dart';
import 'package:conversation_app/widgets/authentication/empty_state_widget.dart';
import 'package:conversation_app/widgets/authentication/guest_notice.dart';
import 'package:conversation_app/widgets/authentication/primary_button.dart';
import 'package:conversation_app/widgets/authentication/social_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeBackScreen extends StatelessWidget {
  const WelcomeBackScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          margin: const EdgeInsets.only(left: 10,right: 10,top: 10),
          padding: const EdgeInsets.symmetric(horizontal:20),
          decoration: BoxDecoration(
          color: const Color(0xFFEFE7DE),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [

              // ─── Empty State Widget ───
              Center(child: const EmptyStateWidget()),
               SizedBox(height: 10,),
              // ─── Header ───
              AuthHeaderSection(
                topLabel: AppText.collection,
                title: '',
                subtitle: AppText.continuecon,
                subtitleColor: const Color(0xFF7A6F66),
                subtitleFontSize: isSmall ? 13 : 16,
                topLabelFontSize: 10,
                topLabelColor: const Color(0xFF7A6F66),
                titleSpans: [
                  TextSpan(
                    text: AppText.welcome,
                    style: GoogleFonts.jost(
                      fontSize: titleSize(),
                      color: const Color(0xFF2B2622),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  TextSpan(
                    text:AppText.back,
                    style: GoogleFonts.jost(
                      fontSize: titleSize(),
                      color: const Color(0xFF7A6F66),
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),

              SizedBox(height: sp(16)),

              // ─── Apple Button ───
              SocialButton(
                text: AppText.continuewithApple,
                imagepath: AppImages.apple,
                onTap: () {},
              ),

              SizedBox(height: sp(10)),

              // ─── Google Button ───
              SocialButton(
                text: AppText.continuewithgoogle,
                imagepath: AppImages.google,
                onTap: () {},
              ),

              SizedBox(height: sp(12)),

              // ─── Or use email ───
            Row(
  children: [
    Expanded(
      child: Container(
        height: 1,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0x009C9590),
              Color(0x389C9590),
              Color(0x009C9590),
            ],
          ),
        ),
      ),
    ),

    const SizedBox(width: 10),

    Text(
      AppText.oruseemail,
      style: GoogleFonts.jost(
        fontSize: 10,
        letterSpacing: 0.96,
        color: const Color(0xFF2B2622),
        fontWeight: FontWeight.w200,
      ),
    ),

    const SizedBox(width: 10),

    Expanded(
      child: Container(
        height: 1,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0x009C9590),
              Color(0x389C9590),
              Color(0x009C9590),
            ],
          ),
        ),
      ),
    ),
  ],
),
              SizedBox(height: sp(12)),

              // ─── Email Button ───
              PrimaryButton(
                text:AppText.continuewithemail,
                onTap: () {

                  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const
                     RestoreYourCollectionScreen()),
                 );
                },
              ),

              SizedBox(height: sp(12)),

              // ─── Guest Button ───
              SocialButton(
                text: AppText.continueasguest,
                onTap: () {},
              ),

              SizedBox(height: sp(12)),

              // ─── Guest Notice ───
              const GuestNotice(),

              SizedBox(height: sp(12)),

              // ─── Restore Purchases ───
              Center(
                child: Text(
                 AppText.restorepurchases,
                  style: GoogleFonts.jost(
                    fontSize: 10,
                    letterSpacing: 0.96,
                    color: const Color(0xFF2B2622),
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

