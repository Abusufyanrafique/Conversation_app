import 'package:conversation_app/Utils/app_textstyles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final IconData? leftIcon;
  final IconData? rightIcon;
  final IconData? extraIcon;
  final Color? backgroundColor;
  final Color borderColor;
  final Color textColor;
  final Color iconColor;
  final bool useGradient;
  final List<Color>? gradientColors;
  final bool useDropShadow;
  final Color? selectedBackgroundColor;
  final List<Color>? selectedGradientColors;
  final Color? selectedTextColor;
  final Color? selectedIconColor;
  final Color? selectedBorderColor;

  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.leftIcon,
    this.rightIcon,
    this.extraIcon,
    this.backgroundColor,
    this.borderColor = Colors.white,
    this.textColor = Colors.white,
    this.iconColor = Colors.white,
    this.useGradient = true,
    this.gradientColors = const [
      Color(0xFF524C47),
      Color(0xA8524C47),
    ],
    this.useDropShadow = true,
    this.selectedBackgroundColor = const Color(0xffEFE7DE),
    this.selectedGradientColors,
    this.selectedTextColor = const Color(0xFF524C47),
    this.selectedIconColor = const Color(0xFF524C47),
    this.selectedBorderColor = const Color(0xFF524C47), 
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isSelected = false;

  //  Light background check — #EFE7DE aur white dono cover
  bool get _isLightBackground {
    final Color? bg = _isSelected
        ? widget.selectedBackgroundColor
        : widget.backgroundColor;
    if (bg == null) return false;
    return bg.computeLuminance() > 0.7;
  }

  //  Dark/black background check
  bool get _isDarkBackground {
    final Color? bg = _isSelected
        ? widget.selectedBackgroundColor
        : widget.backgroundColor;
    if (bg == null) return false;
    return bg.computeLuminance() < 0.05; // pure black ya near-black
  }

  void _handleTap() {
    setState(() {
      _isSelected = !_isSelected;
    });
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    final Color? activeBgColor = _isSelected
        ? widget.selectedBackgroundColor
        : widget.backgroundColor;

    final List<Color>? activeGradient = _isSelected
        ? widget.selectedGradientColors
        : widget.gradientColors;

    //  #EFE7DE → text white, Dark → text white, selected → dark text
    final Color activeTextColor = _isSelected
        ? (widget.selectedTextColor ?? widget.textColor)
        : _isLightBackground
            ? Color(0xFF1C1B1A)        // #EFE7DE par white text
            : widget.textColor;

    final Color activeIconColor = _isSelected
        ? (widget.selectedIconColor ?? widget.iconColor)
        : _isLightBackground
            ? Colors.white
            : widget.iconColor;

    final Color activeBorderColor = _isSelected
        ? (widget.selectedBorderColor ?? widget.borderColor)
        : widget.borderColor;

    final bool showGradient = widget.useGradient &&
        activeGradient != null &&
        !_isSelected;

    //  Dark background par border band
    final bool showBorder = !_isDarkBackground;

    //  Light background par shadow band
    final bool showShadow = widget.useDropShadow && !_isLightBackground;

    return GestureDetector(
      onTap: _handleTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        height: 55.25,
        width: 326,
        decoration: BoxDecoration(
          gradient: showGradient
              ? LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: activeGradient!,
                )
              : null,
          color: showGradient ? null : activeBgColor,
          borderRadius: BorderRadius.circular(15.87),

          //  Black background par border completely hatao
          border: showBorder
              ? Border.all(
                  color: activeBorderColor,
                  width: 1.5,
                )
              : null,

          //  Light/white background par shadow band
          boxShadow: showShadow
              ? const [
                  BoxShadow(
                    color: Color(0x40000000),
                    offset: Offset(0, 4),
                    blurRadius: 4,
                    spreadRadius: 0,
                  ),
                ]
              : null,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 20,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.leftIcon != null) ...[
              Icon(widget.leftIcon, color: activeIconColor),
              const SizedBox(width: 8),
            ],
           Text(
  widget.text,
  style: AppTextStyles.jost(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: activeTextColor,   
  ),
),
            if (widget.extraIcon != null) ...[
              const SizedBox(width: 8),
              Icon(widget.extraIcon, color: activeIconColor),
            ],
            if (widget.rightIcon != null) ...[
              const SizedBox(width: 8),
              Icon(widget.rightIcon, color: activeIconColor),
            ],
          ],
        ),
      ),
    );
  }
}
