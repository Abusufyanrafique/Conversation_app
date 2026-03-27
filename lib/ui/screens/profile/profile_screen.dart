import 'package:conversation_app/Utils/app_images.dart';
import 'package:conversation_app/providers/profile/user_provider.dart';
import 'package:conversation_app/widgets/profile/delete_account.dart';
import 'package:conversation_app/widgets/profile/profile_header.dart';
import 'package:conversation_app/widgets/profile/profile_menu_section.dart';
import 'package:conversation_app/widgets/profile/unlock_premium_banner.dart';
import 'package:conversation_app/widgets/profile/your_journey_section.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProfileScreens extends StatelessWidget {
  const ProfileScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>();

    return Scaffold(
      backgroundColor: const Color(0xFFEFE7DE),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              const ProfileHeader(),
              const SizedBox(height: 20),

              // YOUR JOURNEY
              const YourJourneySection(),
              const SizedBox(height: 20),

              // Unlock Premium Banner (only for free users)
              if (!user.isPremium) ...[
                const UnlockPremiumBanner(),
                const SizedBox(height: 20),
              ],

              // ACCOUNT section
              ProfileMenuSection(
                title: 'ACCOUNT',
                items: [
                  ProfileMenuItem(
                  imagepath: AppImages.blackheart,
                    title: 'Manage Subscription',
                    subtitle: user.isPremium
                        ? 'Premium plan — upgraded to unlock everything'
                        : 'Free plan — upgrade to unlock everything',
                    trailing: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: user.isPremium
                            ? const Color(0xFF7A6F66).withOpacity(0.15)
                            : const Color(0xFF9C9890).withOpacity(0.12),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: user.isPremium
                              ? const Color(0xFF7A6F66).withOpacity(0.25)
                              : const Color(0xFF9C9890).withOpacity(0.20),
                          width: 0.8,
                        ),
                      ),
                      child: Text(
                        user.isPremium ? 'PREMIUM' : 'FREE',
                        style: GoogleFonts.jost(
                          fontSize: 7,
                          letterSpacing: 0.8,
                          fontWeight: FontWeight.w400,
                          color: user.isPremium
                              ? const Color(0xFF7A6F66)
                              : const Color(0xFF9C9890),
                        ),
                      ),
                    ),
                    onTap: () {},
                  ),
                   ProfileMenuItem(
                    containerColor: Color(0xFFD6C0A0).withOpacity(0.18),
                    borderColor: Color(0xFFD6C0A0).withOpacity(0.24),
                   imagepath:AppImages.blackheart,
                    title: 'Restore Purchases',
                    onTap: null,
                  ),
                   ProfileMenuItem(
                    containerColor: Color(0xFFD6C0A0).withOpacity(0.18),
                    borderColor: Color(0xFFD6C0A0).withOpacity(0.24),
                    imagepath: AppImages.setting,
                    title: 'Settings',
                    onTap: null,
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // PREFERENCES section
              ProfileMenuSection(
                title: 'PREFERENCES',
                items: [
                  ProfileMenuItem(
                    containerColor: Color(0xFFAABBA4).withOpacity(0.18),
                    borderColor: Color(0xFFAABBA4).withOpacity(0.24),
                    imagepath: AppImages.notification,
                    title: 'Notifications',
                    subtitle: 'Daily conversation reminders',
                    trailing: Transform.scale(
                      scale: 0.75,
                      child: Switch(
                        value: user.notificationsEnabled,
                        onChanged: (_) => user.toggleNotifications(),
                        activeColor:  Colors.white,
                        activeTrackColor:
                             Colors.black,
                        inactiveThumbColor: const Color(0xFF9C9890),
                        inactiveTrackColor:
                            const Color(0xFF9C9890).withOpacity(0.2),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // LEGAL & SUPPORT section
              ProfileMenuSection(
                title: 'LEGAL & SUPPORT',
                items: [
                   ProfileMenuItem(
                     containerColor: Color(0xFF9D9890).withOpacity(0.10),
                    borderColor: Color(0xFF9D9890).withOpacity(0.24),
                   imagepath: AppImages.lockimage,
                    title: 'Privacy Policy',
                    onTap: null,
                  ),
                   ProfileMenuItem(
                    containerColor: Color(0xFF9D9890).withOpacity(0.10),
                    borderColor: Color(0xFF9D9890).withOpacity(0.24),
                    imagepath: "",
                    title: 'Terms of Service',
                    onTap: null,
                  ),
                   ProfileMenuItem(
                    containerColor: Color(0xFFA4B0C2).withOpacity(0.10),
                    borderColor: Color(0xFFA4B0C2).withOpacity(0.24),
                  imagepath: "",
                    title: 'Contact Support',
                    subtitle: 'We usually reply within 24 hours',
                    onTap: null,
                  ),
                ],
              ),
              SizedBox(height: 24,),
              DeleteAccount(
              onTap: () {
    // TODO: Show confirmation dialog
                     },
                     ),
              const SizedBox(height: 14),

              // Log Out
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF4EFEA).withOpacity(0.01),
                  borderRadius: BorderRadius.circular(15.87),
                  border: Border.all(
                    color: Colors.white, 
                    width: 1),
                ),
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(14.87),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 23),
                    child: Row(
                      children: [
                        Container(
                           height:36 ,
                           width: 36,
                decoration: BoxDecoration(
                color: Color(0xFFC0605A).withOpacity(0.12),
                borderRadius: BorderRadius.circular(11),
                border: Border.all(
                  color: Color(0xFFC0605A).withOpacity(0.20),
                  width: 1,
                )
              ),
                          child: const Icon(Icons.logout,
                              size: 16, color: Color(0xFFC06060)),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          'Log Out',
                          style: GoogleFonts.jost(
                            fontSize: 12.6,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 0.14,
                            color: const Color(0xFFB85C38),
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.chevron_right,
                               size: 15, 
                               color: Color(0xFFC06060)
                               ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),

              // Footer
              Center(
                child: Column(
                  children: [
                    Text(
                      'The Conversation Collection',
                      style: GoogleFonts.jost(
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w300,
                        color: const Color(0xFF7A6F66),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'VERSION 1.0.0 · MADE WITH INTENTION',
                      style: GoogleFonts.jost(
                        fontSize: 9.4,
                        letterSpacing: 1.52,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF7A6F66),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // DEV TOGGLE — plan switch karne ke liye testing
              Center(
                child: TextButton(
                  onPressed: () => user.togglePlan(),
                  child: Text(
                    '[DEV] Switch to ${user.isPremium ? 'Free' : 'Premium'}',
                    style: GoogleFonts.jost(
                      fontSize: 9,
                      color: const Color(0xFF9C9890),
                    ),
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