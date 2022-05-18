import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ssbook/components/custom_app_bar.dart';
import 'package:ssbook/utils/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xffF7F7F7),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, height * 0.2),
        child: const CustomAppBar(),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Livros Favoritos',
                  style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                    color: AppColors.secondaryColor,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'ver todos',
                      style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          color: AppColors.primaryColor),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
