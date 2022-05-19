import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ssbook/components/custom_app_bar.dart';
import 'package:ssbook/components/fav_list.dart';
import 'package:ssbook/components/nav_bar_button.dart';
import 'package:ssbook/utils/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    int selector = 0;

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
        child: Column(
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
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const FavoriteList(),
          ],
        ),
      ),
      bottomNavigationBar: GestureDetector(
        child: NavigationBar(
          backgroundColor: Colors.white,
          destinations: [
            NavBarButton(
              label: 'Início',
              icon: Icons.home_filled,
              isSelected: (selector == 0) ? true : false,
            ),
            NavBarButton(
              label: 'Adicionar',
              icon: Icons.add_circle_outlined,
              isSelected: (selector == 1) ? true : false,
            ),
            NavBarButton(
              label: 'Buscar',
              icon: Icons.search,
              isSelected: (selector == 2) ? true : false,
            ),
            NavBarButton(
              label: 'Favoritos',
              icon: Icons.favorite,
              isSelected: (selector == 3) ? true : false,
            ),
          ],
        ),
      ),
    );
  }
}
