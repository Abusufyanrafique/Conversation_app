import 'package:conversation_app/models/pay_wall/user_type_model.dart';
import 'package:conversation_app/providers/Paywall/user_type_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserTypeCardWidget extends StatelessWidget {
  final UserTypeModel option;
 
  const UserTypeCardWidget({
    super.key, 
    required this.option, 
    
    });

  @override
  Widget build(BuildContext context) {
    return Consumer<UserTypeScreenProvider>(
      builder: (context, provider, _) {
        final selected = provider.isSelected(option.id);

        return GestureDetector(
          onTap: () => provider.selectAudience(option.id),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            decoration: BoxDecoration(
              color: option.backgroundColor,
              borderRadius: BorderRadius.circular(14),
              border: selected
                  ? Border.all(color: const Color(0xFFFFFFFF), width: 1.02)
                  : Border.all(color: Colors.transparent, width: 1.02),
              boxShadow: selected
                  ? [
                     
                    ]
                  : [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      )
                    ],
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     Image(image: AssetImage(option.imagePath!)),
                      const Spacer(),
                      Text(
                        option.title,
                      style: GoogleFonts.jost(
                      fontSize: 18,                    
                      color: const Color(0xFFFFFFFF),
                      fontWeight: FontWeight.w400,
                    ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        option.subtitle,
                         style: GoogleFonts.jost(
                         fontSize:8.4,                    
                         color: const Color(0xFFFFFFFF),
                         fontWeight: FontWeight.w400,
                    ),
                      ),
                    ],
                  ),
                ),

                // Checkmark when selected
                if (selected)
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      width: 22,
                      height: 22,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.check,
                        size:20,
                        color: option.backgroundColor,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}