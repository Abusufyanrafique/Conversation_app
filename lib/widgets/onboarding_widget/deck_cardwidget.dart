import 'package:conversation_app/Utils/app_images.dart';
import 'package:conversation_app/Utils/app_textstyles.dart';
import 'package:conversation_app/models/deck_model.dart';
import 'package:conversation_app/providers/OnboardingProvider/deck_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeckCard extends StatelessWidget {
  final DeckModel deck;
  final bool isTappable; 
  final double height;
  final double? width;
  const DeckCard({
    super.key,
    required this.deck,
    this.isTappable = true, 
    required this.height, 
     this.width, 
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DeckProvider>();
    final isSelected = isTappable ? provider.isSelected(deck.id) : false;

    return GestureDetector(
      // ── isTappable false ho tu tap kaam nahi karega ──
      onTap: isTappable
          ? () => context.read<DeckProvider>().selectDeck(deck.id)
          : null,
      child: AnimatedContainer(
        height: height,
        width:width ,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        // padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          // ── isTappable false = #EFE7DE, selected = dark, default = #F5EFE6 ──
          color: Color(0xFFEFE7DE),
          borderRadius: BorderRadius.circular(15.27),
          border: Border.all(
            // ── isTappable false = white border ──
            color:Colors.white,
            width: 1.02,
          ),
        ),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: deck.leftPadding,
                top: deck.toppadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                
                children: [
                   ImageIcon(
                    AssetImage(
                      deck.imagePath
                      ), 
                    color:Color(0xFF000000),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    deck.title,
                    style:  AppTextStyles.jost(
                     fontSize: 17,
                     color: Color(0xFF2B2622),
                     fontWeight: FontWeight.w400,
      
                         ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Text(
                      deck.subtitle,
                      style: AppTextStyles.jost(
                     fontSize: 10.55,
                     color: Color(0xFF9C9590),
                     fontWeight: FontWeight.w400,
      
                         ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            // ── Checkmark sirf tappable selected card par ──
            if (isSelected && isTappable)
              const Positioned(
                top: 15,
                right: 12,
                child:   Image(image: AssetImage(AppImages.checkmark)),
              ),
          ],
        ),
      ),
    );
  }
}