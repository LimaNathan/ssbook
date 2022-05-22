import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:ssbook/pages/description_page.dart';
import 'package:ssbook/utils/app_colors.dart';

class FavoriteList extends StatefulWidget {
  final QueryResult result;
  const FavoriteList({Key? key, required this.result}) : super(key: key);

  @override
  State<FavoriteList> createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteList> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Column(
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
        SizedBox(
          height: height * .4,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.result.data?['favoriteBooks'].length,
            itemBuilder: (context, index) => Hero(
              tag: DescriptionPage(
                id: widget.result.data?['favoriteBooks'][index]['name'],
              ),
              
              child: GestureDetector(
                onTap: () {
                  setState(() {});
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 5, left: 20),
                  width: 136,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          widget.result.data?['favoriteBooks'][index]['cover'],
                          fit: BoxFit.cover,
                          height: 198,
                          width: 136,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.result.data?['favoriteBooks'][index]['name'],
                        style: GoogleFonts.roboto(
                          color: AppColors.secondaryColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          textStyle: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        maxLines: 2,
                      ),
                      const SizedBox(height: 2),
                      Text(
                        widget.result.data?['favoriteBooks'][index]['author']
                            ['name'],
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: AppColors.descriptionColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
