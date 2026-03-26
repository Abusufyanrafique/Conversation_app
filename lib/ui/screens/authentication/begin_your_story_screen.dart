import 'package:conversation_app/Utils/app_images.dart';
import 'package:conversation_app/Utils/app_text.dart' as AppText;
import 'package:conversation_app/providers/authentication/auth_see_you_screen_provider.dart';
import 'package:conversation_app/ui/screens/dashboard/dashboard_screen.dart';
import 'package:conversation_app/widgets/authentication/auth_screen_row.dart';
import 'package:conversation_app/widgets/authentication/auth_see_you_screen_textfield.dart';
import 'package:conversation_app/widgets/authentication/guest_bottom_sheet.dart';
import 'package:conversation_app/widgets/authentication/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BeginYourStoryScreen extends StatefulWidget {
  const BeginYourStoryScreen({super.key});

  @override
  State<BeginYourStoryScreen> createState() => _BeginYourStoryScreenState();
}

class _BeginYourStoryScreenState extends State<BeginYourStoryScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
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
              SizedBox(height: sp(20)),
              AuthScreenRow(
                imagePath: AppImages.foucsarrow,
                text: AppText.signin,
                onTap: () {},
              ),
              SizedBox(height: sp(10)),
              Text(
                AppText.begin1,
                style: GoogleFonts.jost(
                  fontSize: titleSize(),
                  color: const Color(0xFF2B2622),
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Text(
                AppText.afewmoredetails,
                style: GoogleFonts.jost(
                  fontSize: isSmall ? 13 : 16,
                  color: const Color(0xFF7A6F66),
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: sp(40)),
              AuthSeeYouScreenTextField(
                label: 'YOUR NAME',
                hint: 'First name',
                controller: _nameController, // ── local ──
              ),
              SizedBox(height: sp(12)),
              AuthSeeYouScreenTextField(
                label: 'EMAIL ADDRESS',
                hint: 'your@email.com',
                controller: _emailController, // ── local ──
              ),
              SizedBox(height: sp(16)),
              AuthSeeYouScreenTextField(
                label: 'CREATE PASSWORD',
                hint: 'At least 8 characters',
                controller: _passwordController, // ── local ──
                isPassword: true,
                isPasswordVisible: auth.isPasswordVisible,
                onTogglePassword: auth.togglePasswordVisibility,
              ),
              SizedBox(height: sp(80)),
              PrimaryButton(
                text: AppText.createaccount,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DashBoardScreen(),
                    ),
                  );
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (_) => const GuestBottomSheet(),
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
                        text: 'Already have an account? ',
                        style: GoogleFonts.jost(
                          fontSize: 12,
                          color: Colors.black,
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