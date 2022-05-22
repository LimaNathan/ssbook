import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ssbook/components/custom_nav_bar.dart';
import 'package:ssbook/utils/app_colors.dart';
import 'package:ssbook/utils/text_theme.dart';

class DescriptionPage extends StatefulWidget {
  final String name;
  final String cover;
  final String author;
  final String description;
  final bool isFavorite;
  const DescriptionPage({
    Key? key,
    required this.name,
    required this.cover,
    required this.author,
    required this.description,
    required this.isFavorite,
  }) : super(key: key);

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  @override
  Widget build(BuildContext context) {
    var heigth = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              Container(
                margin: const EdgeInsets.only(
                  right: 30,
                ),
                child: const Icon(
                  Icons.more_vert,
                ),
              ),
            ],
            floating: true,
            expandedHeight: heigth * .45,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(widget.cover, fit: BoxFit.cover),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 21, vertical: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: heigth * .1,
                        width: width * .75,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.name,
                              maxLines: 2,
                              style: CustomTextTheme().title2,
                            ),
                            Text(widget.author,
                                style: CustomTextTheme().subtitle),
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: widget.isFavorite
                              ? const Icon(
                                  Icons.favorite,
                                  color: AppColors.primaryColor,
                                )
                              : const Icon(
                                  Icons.favorite_outline,
                                  color: AppColors.secondaryColor,
                                ))
                    ],
                  ),
                ),
                SizedBox(
                  child: Container(
                    margin:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 30),
                    child: Text(
                      widget.description,
                      style: GoogleFonts.roboto(
                          fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}
