import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ssbook/components/custom_app_bar.dart';
import 'package:ssbook/components/fav_authors.dart';
import 'package:ssbook/components/fav_list.dart';
import 'package:ssbook/components/libary.dart';
import 'package:ssbook/utils/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selector = 0;
  void _onItemTapped(int value) {
    setState(() {
      selector = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xffF7F7F7),
      appBar: PreferredSize(
        preferredSize: Size(
          double.infinity,
          height * 0.2,
        ),
        child: const CustomAppBar(),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            const FavoriteList(),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                ),
              ),
              child: Column(
                children: const [
                  FavAuthors(),
                  Libary(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: GestureDetector(
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
      ),
    );
  }
}
