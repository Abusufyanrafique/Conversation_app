import 'package:conversation_app/providers/DashboardProvider/dashboard_provider.dart';
import 'package:conversation_app/ui/screens/dashboard/HomeScreen.dart';
import 'package:conversation_app/ui/screens/dashboard/ProfileScreen.dart';
import 'package:conversation_app/ui/screens/library/library_screen.dart';
import 'package:conversation_app/ui/screens/savedconversations/saved_conversations_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  static const List<Widget> _pages = [
    HomeScreen(),
    LibraryScreen(),
    SavedConversationsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final navProvider = Provider.of<DashboardProvider>(context);

    return Scaffold(
      body: _pages[navProvider.currentIndex],
      bottomNavigationBar: _buildBottomNavBar(context, navProvider),
    );
  }

  Widget _buildBottomNavBar(
    BuildContext context,
    DashboardProvider navProvider,
  ) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
        ),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(

        ),
        child: BottomNavigationBar(
          currentIndex: navProvider.currentIndex,
          onTap: (index) => navProvider.setIndex(index),
          backgroundColor: const Color(0xFFF5EDE3),
          selectedItemColor: const Color(0xFF2B2622),
          unselectedItemColor: const Color(0xFF2B2622).withOpacity(0.5),
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,

         // BottomNavigationBar mein:
selectedLabelStyle: GoogleFonts.jost(
  fontSize: 10,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.67,
  color: Color(0xFF2B2622)
),
unselectedLabelStyle: GoogleFonts.jost(
  fontSize: 12,
  fontWeight: FontWeight.w400,
  letterSpacing: 0.3,
),

          // selectedFontSize aur unselectedFontSize hatao
          // kyunki ab yeh LabelStyle se control ho raha hai

          items: [
            _navItem('assets/icons/dashboard/nav_home.png', 'Home', 0, navProvider.currentIndex),
            _navItem('assets/icons/dashboard/nav_library.png', 'Library', 1, navProvider.currentIndex),
            _navItem('assets/icons/dashboard/nav_heart.png', 'Saved', 2, navProvider.currentIndex),
            _navItem('assets/icons/dashboard/nav_profile.png', 'Profile', 3, navProvider.currentIndex),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _navItem(
    String imagePath,
    String label,
    int index,
    int currentIndex,
  ) {
    final isActive = index == currentIndex;

    return BottomNavigationBarItem(
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imagePath,
            width: 21,
            height: 21,
            color: isActive
                ? const Color(0xFF2B2622)
                : const Color(0xFF2B2622).withOpacity(0.5),
          ),
          if (isActive)
            Container(
              margin: const EdgeInsets.only(top: 3.55),
              width: 13.99,
              height: 2.48,
              decoration: BoxDecoration(
                color: const Color(0xFF2B2622),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
        ],
      ),
      label: label,
    );
  }
}