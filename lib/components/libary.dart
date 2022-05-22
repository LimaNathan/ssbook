import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:ssbook/pages/description_page.dart';
import 'package:ssbook/utils/app_colors.dart';

class Libary extends StatefulWidget {
  final QueryResult result;
  const Libary({Key? key, required this.result}) : super(key: key);

  @override
  State<Libary> createState() => _LibaryState();
}

class _LibaryState extends State<Libary> {
  List categories = ['ALL'];
  var selectedCategory = 0;

  @override
  void initState() {
    super.initState();

    widget.result.data?['allBooks']?.forEach((book) {
      if (!categories.contains(book['category'])) {
        categories.add(book['category']);
      }
    });
  }

  int _getLength() {
    int counter = 0;
    int completeList = widget.result.data?['allBooks'].length;

    widget.result.data?['allBooks']?.forEach((book) {
      if (categories.contains(book['category'])) {
        counter++;
      }
    });
    return (categories[selectedCategory] == 'ALL') ? completeList : counter;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 20.0, left: 20.0, top: 32, bottom: 20),
              child: Text(
                'Biblioteca',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: AppColors.secondaryColor,
                ),
              ),
            ),
          ),
          ConstrainedBox(
            constraints:
                const BoxConstraints(maxWidth: double.infinity, maxHeight: 40),
            child: Container(
              padding: const EdgeInsets.only(left: 20),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => setState(() {
                    selectedCategory = index;
                  }),
                  child: Card(
                    color: index == selectedCategory
                        ? AppColors.primaryColor
                        : Colors.white,
                    elevation: 0,
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        color: AppColors.backgroundColor,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(16),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 6),
                      child: Center(
                        child: Text(
                          categories[index],
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: index == selectedCategory
                                  ? Colors.white
                                  : AppColors.descriptionColor),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: _getLength() * (height * .115), minHeight: 80),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _getLength(),
              itemBuilder: (context, index) {
                if (widget.result.data?['allBooks'][index]['category'] ==
                    categories[selectedCategory]) {
                  return GestureDetector(
                    onTap: () {
                      var resumedResult =
                          widget.result.data?['allBooks'][index];
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => DescriptionPage(
                            name: resumedResult['name'].toString(),
                            cover: resumedResult['cover'].toString(),
                            author: resumedResult['author']['name'].toString(),
                            description:
                                resumedResult['description'].toString(),
                            isFavorite: resumedResult['isFavorite'],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Card(
                        elevation: 0,
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                widget.result.data?['allBooks'][index]['cover'],
                                fit: BoxFit.cover,
                                width: 48,
                                height: 70,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: width * .7,
                                    child: Text(
                                      widget.result.data?['allBooks'][index]
                                          ['name'],
                                      maxLines: 2,
                                      style: GoogleFonts.roboto(
                                        color: AppColors.secondaryColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        textStyle: const TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 6),
                                    child: Text(
                                      widget.result.data?['allBooks'][index]
                                          ['author']['name'],
                                      style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.descriptionColor,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                } else if (categories[selectedCategory] == 'ALL') {
                  return GestureDetector(
                    onTap: () {
                      var resumedResult =
                          widget.result.data?['allBooks'][index];
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => DescriptionPage(
                            name: resumedResult['name'].toString(),
                            cover: resumedResult['cover'].toString(),
                            author: resumedResult['author']['name'].toString(),
                            description:
                                resumedResult['description'].toString(),
                            isFavorite: resumedResult['isFavorite'],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Card(
                        elevation: 0,
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                widget.result.data?['allBooks'][index]['cover'],
                                fit: BoxFit.cover,
                                width: 48,
                                height: 70,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: width * .7,
                                    child: Text(
                                      widget.result.data?['allBooks'][index]
                                          ['name'],
                                      maxLines: 2,
                                      style: GoogleFonts.roboto(
                                        color: AppColors.secondaryColor,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        textStyle: const TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 6),
                                    child: Text(
                                      widget.result.data?['allBooks'][index]
                                          ['author']['name'],
                                      style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.descriptionColor,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
