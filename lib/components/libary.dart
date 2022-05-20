import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:ssbook/utils/app_colors.dart';

class Libary extends StatefulWidget {
  const Libary({Key? key}) : super(key: key);

  @override
  State<Libary> createState() => _LibaryState();
}

class _LibaryState extends State<Libary> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    int? selectedCategory;

    List categories = ['ALL'];
    String getBooks = """

          query GetAllBooks{
          allBooks{
            name
            author{name}
            cover
            category
            }
          }

""";
    return Query(
        options: QueryOptions(document: gql(getBooks)),
        builder: (
          QueryResult result, {
          VoidCallback? refetch,
          FetchMore? fetchMore,
        }) {
          if (result.isLoading) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: height * .1),
              padding: const EdgeInsets.all(10),
              child: const CircularProgressIndicator(),
            );
          }

          for (int i = 0; i < result.data?['allBooks'].length; i++) {
            if (categories.contains(result.data?['allBooks'][i]['category'])) {
              null;
            } else {
              categories.add(result.data?['allBooks'][i]['category']);
            }
          }
          return SafeArea(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 20.0, left: 20.0, top: 32, bottom: 20),
                    child: Text(
                      'Livros Favoritos',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: AppColors.secondaryColor,
                      ),
                    ),
                  ),
                ),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                      maxWidth: double.infinity, maxHeight: 40),
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
                          color: selectedCategory == index
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
                SizedBox(
                  width: double.infinity,
                  height: result.data?['allBooks'].length * 80.toDouble(),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: result.data?['allBooks'].length,
                    itemBuilder: (context, index) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Card(
                        elevation: 0,
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                result.data?['allBooks'][index]['cover'],
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
                                      result.data?['allBooks'][index]['name'],
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
                                      result.data?['allBooks'][index]['author']
                                          ['name'],
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
                  ),
                ),
              ],
            ),
          );
        });
  }
}
