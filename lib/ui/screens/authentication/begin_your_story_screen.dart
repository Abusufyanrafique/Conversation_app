import 'package:conversation_app/Utils/app_images.dart';
import 'package:conversation_app/Utils/app_text.dart' as AppText;
import 'package:conversation_app/providers/authentication/auth_see_you_screen_provider.dart';
import 'package:conversation_app/widgets/authentication/auth_screen_row.dart';
import 'package:conversation_app/widgets/authentication/auth_see_you_screen_textfield.dart';
import 'package:conversation_app/widgets/authentication/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BeginYourStoryScreen extends StatelessWidget {
  const BeginYourStoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final auth = context.watch<AuthSeeYouScreenProvider>();
    final size = MediaQuery.of(context).size;
    final h = size.height;

    // Screen height breakpoints
    final isSmall  = h < 680;   // iPhone SE, small Android
    final isMedium = h < 800;   // normal phones

    // Responsive spacing — shrinks on smaller screens
    // double sp(double val) {
    //   if (isSmall)  return val * 0.45;
    //   if (isMedium) return val * 0.72;
    //   return val;
    // }

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height:20,),
            AuthScreenRow(
             imagePath: AppImages.foucsarrow,
             text: AppText.signin,
             onTap: () {},
              ),
              SizedBox(height: 10,),
              Text(AppText.begin1,
               style: GoogleFonts.jost(
                      fontSize: titleSize(),
                      color: const Color(0xFF2B2622),
                      fontWeight: FontWeight.w300,
                       fontStyle: FontStyle.italic,
                    ),
              ),
             
              Text(AppText.afewmoredetails,
               style: GoogleFonts.jost(
                      fontSize:16,
                      color: const Color(0xFF7A6F66),
                      fontWeight: FontWeight.w300,
                       fontStyle: FontStyle.italic,
                    ),
              ),
              SizedBox(height: 40,),
               AuthSeeYouScreenTextField(
              label: 'YOUR NAME',
              hint: 'First name',
              controller: auth.passwordController,
              isPassword: true,
              isPasswordVisible: auth.isPasswordVisible,
              onTogglePassword: auth.togglePasswordVisibility,
            ),
            SizedBox(height: 12,),
               AuthSeeYouScreenTextField(
              label: 'EMAIL ADDRESS',
              hint: 'your@email.com',
              controller: auth.emailController,
            ),

            const SizedBox(height: 16),

            // ── Password Field ──
            AuthSeeYouScreenTextField(
              label: 'CREATE PASSWORD',
              hint: 'At least 8 characters',
              controller: auth.passwordController,
              isPassword: true,
              isPasswordVisible: auth.isPasswordVisible,
              onTogglePassword: auth.togglePasswordVisibility,
            ),
            
          SizedBox(height: 114,),
          // Spacer(),
          PrimaryButton(
                text:AppText.createaccount,
                onTap: () {

                //   Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()),
                //  );
                },
              ),
              SizedBox(height:12 ,),
              Center(
  child: RichText(
    text: TextSpan(
      style: GoogleFonts.jost(
        fontSize: 12,
        color:  Colors.black,
        letterSpacing: 0.96,
        fontWeight: FontWeight.w200,
      ),
      children: [
         TextSpan(text: 'Already have an account?',
        style: GoogleFonts.jost(
        fontSize: 12,
        color:  Colors.black,
        letterSpacing: 0.96,
        fontWeight: FontWeight.w200,
      ),
        ),
        TextSpan(
          text: 'Sign in',
          style: GoogleFonts.jost(
            fontSize: 10,
            color: const Color(0xFF7A6F66),
            letterSpacing: 0.96,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
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