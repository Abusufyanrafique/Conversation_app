import 'package:conversation_app/providers/Paywall/plan_provider_subscription.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PricingPlanTile extends StatelessWidget {
  final BillingCycle cycle;
  final String title;
  final String description;
  final String price;
  final String priceLabel;
  final String? badge;
  final VoidCallback? onTap;

  const PricingPlanTile({
    super.key,
    required this.cycle,
    required this.title,
    required this.description,
    required this.price,
    required this.priceLabel,
    this.badge, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PricingProviderSubscription>();
    final isSelected = provider.selected == cycle;

    final width = MediaQuery.of(context).size.width;

    return GestureDetector(
       onTap: () {
    context.read<PricingProviderSubscription>().select(cycle);
    onTap?.call(); 
  },
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0,right: 20),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
        
          margin: EdgeInsets.symmetric(vertical: width * 0.025),
        
          
          width: double.infinity,
        
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.05,
            vertical: width * 0.015,
          ),
        
          decoration: BoxDecoration(
            color: const Color(0xFFEFE7DE),
            borderRadius: BorderRadius.circular(15.87),
            border: Border.all(
              color: Colors.white,
              width: 1,
            ),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: const Color(0xFF8B6F47).withAlpha(38),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    )
                  ]
                : [],
          ),
        
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center, 
            children: [
              // ── Radio circle ──
            AnimatedContainer(
  duration: const Duration(milliseconds: 200),
  width: width * 0.055,
  height: width * 0.055,
  decoration: BoxDecoration(
    shape: BoxShape.circle,
    color: isSelected
        ? const Color(0xFFBF9088) // selected: filled
        : Colors.transparent,     // unselected: empty
    border: Border.all(
      color: const Color(0xFF9C8472).withOpacity(0.3),
      width: 1,
    ),
  ),
  child: Center(
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: isSelected ? width * 0.022 : width * 0.040,  // selected: chota, unselected: bada
      height: isSelected ? width * 0.022 : width * 0.040,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(
          color: const Color(0xFF9C8472).withOpacity(0.3),
          width: 1,
        ),
      ),
    ),
  ),
),
        
              SizedBox(width: width * 0.03),
        
              // ── Text info ──
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min, 
                  children: [
                    
                    Text(
                      title,
                      style: GoogleFonts.jost(
                        fontSize: 13, 
                        color: const Color(0xFF221F1C),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: width * 0.008),
                    Text(
                      description,
                      style: GoogleFonts.jost(
                        fontSize: 10, 
                        color: const Color(0xFFA09890),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
        
              SizedBox(width: width * 0.02),
        
              // ── Price ──
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min, 
                children: [
                  SizedBox(height: 10,),
                  Text(
                    price,
                    style: GoogleFonts.jost(
                      fontSize: 20,
                      color: const Color(0xFF221F1C),
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    priceLabel,
                    style: GoogleFonts.jost(
                      fontSize: 10, 
                      color: const Color(0xFFA09890),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
        
                  
                  if (badge != null) ...[
                    SizedBox(height: width * 0.008),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        // horizontal: 2,
                        vertical: 2,
                      ),
                      child: Text(
                        badge!,
                        style: GoogleFonts.jost(
                          fontSize: 8,
                          fontWeight: FontWeight.w300,
                          color: const Color(0xFFAEBAA8),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}