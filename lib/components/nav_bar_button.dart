import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ssbook/utils/app_colors.dart';

class NavBarButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
 
  const NavBarButton(
      {Key? key,
      required this.label,
      required this.icon,
      required this.isSelected,
 })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: isSelected ? AppColors.primaryColor : AppColors.navBarColor,
        ),
        Text(
            textAlign: TextAlign.center,
            label,
            style: GoogleFonts.roboto(
                fontWeight: FontWeight.w500,
                fontSize: 10,
                color: isSelected
                    ? AppColors.primaryColor
                    : AppColors.navBarColor))
      ],
    );
  }
}
