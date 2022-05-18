import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ssbook/utils/app_colors.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  int selectedTab = 0;
  List<String> tabs = ['Meus Livros', 'Emprestados'];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(32),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  const TextSpan(
                    text: 'SS',
                    children: [
                      TextSpan(
                        text: 'BOOK',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                        ),
                      )
                    ],
                  ),
                  style: GoogleFonts.bebasNeue(
                    fontSize: 33,
                    fontWeight: FontWeight.w400,
                    color: AppColors.secondaryColor,
                  ),
                ),
                CircleAvatar(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(32)),
                    child: Image.network(
                      "https://sscdn.co/gcs/studiosol/2022/mobile/avatar.jpg",
                      fit: BoxFit.cover,
                      height: 40,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: height * .05,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => setState(() {
                    selectedTab = index;
                  }),
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          tabs[index],
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: AppColors.secondaryColor,
                          ),
                        ),
                        index == selectedTab
                            ? Container(
                                width: 94,
                                height: 4,
                                decoration: const BoxDecoration(
                                  color: AppColors.primaryColor,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(2),
                                    topRight: Radius.circular(2),
                                  ),
                                ),
                              )
                            : const SizedBox(
                                width: 94,
                                height: 4,
                              ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
