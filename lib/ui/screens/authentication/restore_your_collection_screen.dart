import 'package:conversation_app/Utils/app_images.dart';
import 'package:conversation_app/Utils/app_text.dart' as AppText;
import 'package:conversation_app/widgets/authentication/auth_header_section.dart';
import 'package:conversation_app/widgets/authentication/auth_screen_row.dart';
import 'package:conversation_app/widgets/authentication/empty_state_widget.dart';
import 'package:conversation_app/widgets/authentication/restore_option_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RestoreYourCollectionScreen extends StatelessWidget {
  const RestoreYourCollectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            color: const Color(0xFFEFE7DE),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: sp(37)),       // was: 37.07 fixed
              AuthScreenRow(
                imagePath: AppImages.foucsarrow,
                text: AppText.resetpassword,
                onTap: () {},
              ),
              SizedBox(height: sp(48)),       // was: 48 fixed
              Center(child: const EmptyStateWidget()),
              SizedBox(height: sp(29)),       // was: 29 fixed
              AuthHeaderSection(
                topLabel: '',
                title: '',
                subtitle: AppText.enteryouremail,
                subtitleColor: const Color(0xFF7A6F66),
                subtitleFontSize: isSmall ? 12 : 16,
                topLabelFontSize: 10,
                topLabelColor: const Color(0xFF7A6F66),
                titleSpans: [
                  TextSpan(
                    text: AppText.restoreyour,
                    style: GoogleFonts.jost(
                      fontSize: titleSize(),
                      color: const Color(0xFF2B2622),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  TextSpan(
                    text: AppText.ncollection,
                    style: GoogleFonts.jost(
                      fontSize: titleSize(),
                      color: const Color(0xFF7A6F66),
                      fontWeight: FontWeight.w300,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
              SizedBox(height: sp(19)),
              const RestoreOptionsSection(),
            ],
          ),
        ),
      ),
    );
  }
}