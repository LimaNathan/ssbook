import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/app_colors.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  var selector = 0;
  void _onItemTapped(int value) {
    setState(() {
      selector = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: BottomNavigationBar(
          unselectedLabelStyle:
              GoogleFonts.roboto(fontWeight: FontWeight.w500, fontSize: 10),
          selectedItemColor: AppColors.primaryColor,
          showUnselectedLabels: true,
          unselectedItemColor: AppColors.navBarColor,
          selectedLabelStyle:
              GoogleFonts.roboto(fontWeight: FontWeight.w500, fontSize: 10),
          backgroundColor: Colors.white,
          iconSize: 30,
          onTap: _onItemTapped,
          currentIndex: selector,
          items: const [
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(
                Icons.home_filled,
              ),
              label: 'Início',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle_outlined,
              ),
              label: 'Adicionar',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              label: 'Buscar',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
              ),
              label: 'Favoritos',
            ),
          ],
        ),
      );
  }
}
