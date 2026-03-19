import 'package:conversation_app/Utils/app_images.dart';
import 'package:conversation_app/providers/Paywall/question_screen_provider.dart';
import 'package:conversation_app/ui/screens/pay_wall/pay_wall_subscription_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QuestionScreenbottomNav extends StatelessWidget {
  const QuestionScreenbottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QuestionScreenProvider>(context);
    final isLast = provider.currentIndex == provider.totalCards - 1;

    return Container(
      // margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 1),
      decoration: BoxDecoration(
        color: const Color(0xFFEFE7DE), 
        border: Border(
          top: BorderSide(
            color: Colors.white.withOpacity(0.4), 
            width: 1
            ),
        ),
      ),
      
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: provider.currentIndex > 0
                  ? () => provider.previousPage()
                  : null,
              child: AnimatedOpacity(
                opacity: provider.currentIndex > 0 ? 1.0 : 0.3,
                duration: const Duration(milliseconds: 250),
                child:  Container(
                      height: 37.87,
                      width: 37.87,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.87),
                        border: Border.all(
                          color: Colors.white, 
                          width: 1
                          ),
                      ),
                      child: InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Image(
                          image: AssetImage(
                            AppImages.foucsarrow
                            ),
                        ),
                      ),
                    ),
              ),
            ),
        
            // NEXT CARD → / GET STARTED Button (wide pill)
            Expanded(
              child: GestureDetector(
                onTap: () {
                  if (isLast) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PaywallSubscriptionScreen(),
                      ),
                    );
                  } else {
                    provider.nextPage(context);
                  }
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2B2622), // dark brown/black
                    borderRadius: BorderRadius.circular(15.87),
                  ),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    child: Row(
                      key: ValueKey(isLast),
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          isLast ? "SEE WHATS’S NEXT →" : "NEXT CARD",
                          style: GoogleFonts.jost(
                        fontSize: 13, 
                        color: const Color(0xFFF5F0EB),
                        fontWeight: FontWeight.w500,
                      ),
                        ),
                        
                      ],
                    ),
                  ),
                ),
              ),
            ),
        
            // ♡ Favorite Button (circle)
            GestureDetector(
              onTap: () {
                // Add to favorites logic here
              },
              child:Container(
                      height: 37.87,
                      width: 37.87,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.87),
                        border: Border.all(
                          color: Colors.white, 
                          width: 1
                          ),
                      ),
                      child: InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Image(
                          image: AssetImage(
                            AppImages.heart
                            ),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}