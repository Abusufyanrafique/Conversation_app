import 'package:conversation_app/Utils/app_images.dart';
import 'package:conversation_app/Utils/app_text.dart' as AppText;
import 'package:conversation_app/providers/authentication/auth_see_you_screen_provider.dart';
import 'package:conversation_app/ui/screens/authentication/check_your_email_screen.dart';
import 'package:conversation_app/widgets/authentication/auth_header_section.dart';
import 'package:conversation_app/widgets/authentication/auth_screen_row.dart';
import 'package:conversation_app/widgets/authentication/auth_see_you_screen_textfield.dart';
import 'package:conversation_app/widgets/authentication/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

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
      if (isSmall)  return 28;
      if (isMedium) return 38;
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
              SizedBox(height: sp(37)),
              AuthScreenRow(
                imagePath: AppImages.foucsarrow,
                text: AppText.resetpassword,
                onTap: () {},
              ),
              SizedBox(height: sp(48)),
              AuthHeaderSection(
                topLabel: '',
                title: '',
                subtitle: AppText.resetlink,
                subtitleColor: const Color(0xFF7A6F66),
                subtitleFontSize: isSmall ? 12 : 16,
                topLabelFontSize: 10,
                topLabelColor: const Color(0xFF7A6F66),
                titleSpans: [
                  TextSpan(
                    text: AppText.forgotyourpassword,
                    style: GoogleFonts.jost(
                      fontSize: titleSize(),
                      color: const Color(0xFF2B2622),
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
              SizedBox(height: sp(40)),
              AuthSeeYouScreenTextField(
                label: 'EMAIL ADDRESS',
                hint: 'your@email.com',
                controller: _emailController, // ── local controller ──
              ),
              SizedBox(height: sp(16)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Resend in 30 seconds?',
                    style: GoogleFonts.jost(
                      fontSize: 12,
                      color: const Color(0xFF7A6F66),
                      letterSpacing: 0.96,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              SizedBox(height: sp(150)),
              PrimaryButton(
                text: AppText.sendresentlink,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CheckYourEmailScreen(),
                    ),
                  );
                },
              ),
              SizedBox(height: sp(12)),
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
                        text: 'Back to sign in',
                        style: GoogleFonts.jost(
                          fontSize: 10,
                          color: Colors.black,
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