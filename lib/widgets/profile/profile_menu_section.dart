import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileMenuSection extends StatelessWidget {
  final String title;
  final List<ProfileMenuItem> items;

  const ProfileMenuSection({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row( 
          children: [
            Text(
          title,
          style: GoogleFonts.jost(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            letterSpacing: 2.28,
            color: const Color(0xFF7A6F66),
          ),
        ),
        SizedBox(width: 7,),
                     Expanded(
                     child: Container(
                       height: 0.9,
                       color: const Color(0xFF9D9890).withOpacity(0.08),
                     ),
                   ),
        ],
        ),
        const SizedBox(height: 23),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF4EFEA).withOpacity(0.01),
            borderRadius: BorderRadius.circular(15.87),
            border: Border.all(color: Colors.white, width: 1),
          ),
          child: Column(
            children: List.generate(items.length, (i) {
              final item = items[i];
              final isLast = i == items.length - 1;
              return Column(
                children: [
                  _MenuTile(item: item),
                  if (!isLast)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Container(
                        height: 0.5,
                        color: const Color(0xFF9C9890).withOpacity(0.15),
                      ),
                    ),
                ],
              );
            }),
          ),
        ),
      ],
    );
  }
}

class _MenuTile extends StatelessWidget {
  final ProfileMenuItem item;
  const _MenuTile({required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: item.onTap,
      borderRadius: BorderRadius.circular(15.87),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
        child: Row(
          children: [
           Container(
           height: 34.58,
           width: 34.58,
           decoration: BoxDecoration(
           color: (item.containerColor ?? Color(0xFFCCA6A0)).withOpacity(0.18),
           borderRadius: BorderRadius.circular(10.55),
           border: Border.all(
          color: (item.borderColor ?? Color(0xFFCCA6A0)).withOpacity(0.24) // ← yahan
    )
  ),
  child: Image(image: AssetImage(item.imagepath)),
),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: GoogleFonts.jost(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.13,
                      color: item.titleColor ?? const Color(0xFF1C1A17),
                    ),
                  ),
                  if (item.subtitle != null) ...[
                    const SizedBox(height: 1),
                    Text(
                      item.subtitle!,
                      style: GoogleFonts.jost(
                        fontSize: 9,
                        color: const Color(0xFF9D9890),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ],
              ),
            ),
            if (item.trailing != null)
              item.trailing!
            else
              const Icon(Icons.chevron_right, size: 15, color: Color(0xFF9C9890)),
          ],
        ),
      ),
    );
  }
}

class ProfileMenuItem {
  // final IconData icon;
  final String imagepath;
  final String title;
  final String? subtitle;
  final Color? iconColor;
  final Color? titleColor;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color? containerColor;
  final Color? borderColor; 

  const ProfileMenuItem({
   
    required this.title,
    this.subtitle,
    this.iconColor,
    this.titleColor,
    this.trailing,
    this.onTap, 
    required this.imagepath, 
    this.containerColor, 
    this.borderColor,
  });
}