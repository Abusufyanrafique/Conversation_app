import 'package:conversation_app/Utils/app_images.dart';
import 'package:conversation_app/Utils/app_text.dart' as AppText;
import 'package:conversation_app/providers/authentication/auth_see_you_screen_provider.dart';
import 'package:conversation_app/ui/screens/authentication/forgot_password_screen.dart';
import 'package:conversation_app/widgets/authentication/auth_header_section.dart';
import 'package:conversation_app/widgets/authentication/auth_screen_row.dart';
import 'package:conversation_app/widgets/authentication/auth_see_you_screen_textfield.dart';
import 'package:conversation_app/widgets/authentication/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SeeYouAgainScreen extends StatelessWidget {
  const SeeYouAgainScreen({super.key});

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
      if (isSmall)  return 28;   // 36 → 28
      if (isMedium) return 38;   // 42 → 38
      return 48;
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: sp(37)),         // was: 37.07
              AuthScreenRow(
                imagePath: AppImages.foucsarrow,
                text: AppText.signin,
                onTap: () {},
              ),
              SizedBox(height: sp(48)),         // was: 48
              AuthHeaderSection(
                topLabel: '',
                title: '',
                subtitle: AppText.enterdetails,
                subtitleColor: const Color(0xFF7A6F66),
                subtitleFontSize: isSmall ? 12 : 16,
                topLabelFontSize: 10,
                topLabelColor: const Color(0xFF7A6F66),
                titleSpans: [
                  TextSpan(
                    text: AppText.goodto,
                    style: GoogleFonts.jost(
                      fontSize: titleSize(),
                      color: const Color(0xFF2B2622),
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  TextSpan(
                    text: AppText.seeyouagain,
                    style: GoogleFonts.jost(
                      fontSize: titleSize(),
                      color: const Color(0xFF7A6F66),
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
              SizedBox(height: sp(40)),         // was: 40
              AuthSeeYouScreenTextField(
                label: 'EMAIL ADDRESS',
                hint: 'your@email.com',
                controller: auth.emailController,
              ),
              SizedBox(height: sp(16)),         // was: 16
              AuthSeeYouScreenTextField(
                label: 'PASSWORD',
                hint: '********',
                controller: auth.passwordController,
                isPassword: true,
                isPasswordVisible: auth.isPasswordVisible,
                onTogglePassword: auth.togglePasswordVisibility,
              ),
              SizedBox(height: sp(14)),         // was: 14.53
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot password?',
                    style: GoogleFonts.jost(
                      fontSize: 12,
                      color: const Color(0xFF7A6F66),
                      letterSpacing: 0.96,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              SizedBox(height: sp(250)),         // was: 45
              PrimaryButton(
                text: AppText.signin,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ForgotPasswordScreen(),
                    ),
                  );
                },
              ),
              SizedBox(height: sp(12)),         // was: 12
              Center(
                child: RichText(
                  text: TextSpan(
                    style: GoogleFonts.jost(
                      fontSize: 12,
                      color: Colors.black,
                      letterSpacing: 0.96,
                      fontWeight: FontWeight.w200,
                    ),
                    children: [
                      TextSpan(
                        text: 'No Account yet? ',
                        style: GoogleFonts.jost(
                          fontSize: 12,
                          color: Colors.black,
                          letterSpacing: 0.96,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      TextSpan(
                        text: 'Create one',
                        style: GoogleFonts.jost(
                          fontSize: 10,
                          color: const Color(0xFF7A6F66),
                          letterSpacing: 0.96,
                          fontWeight: FontWeight.w300,
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