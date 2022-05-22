import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ssbook/utils/app_colors.dart';

class CustomTextTheme {
  var title = GoogleFonts.roboto(
    color: AppColors.secondaryColor,
    fontWeight: FontWeight.w700,
    fontSize: 16,
    textStyle: const TextStyle(
      overflow: TextOverflow.ellipsis,
    ),
  );

  var title2 = GoogleFonts.roboto(
    fontWeight: FontWeight.w700,
    fontSize: 20,
    color: AppColors.secondaryColor,
  );

  var option = GoogleFonts.roboto(
    fontWeight: FontWeight.w700,
    fontSize: 14,
    color: AppColors.primaryColor,
  );
  var alternativeOption = GoogleFonts.roboto(
    fontWeight: FontWeight.w700,
    fontSize: 14,
    color: AppColors.secondaryColor,
  );

  var subtitle = GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    color: AppColors.descriptionColor,
  );
}
