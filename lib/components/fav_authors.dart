import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../utils/app_colors.dart';

class FavAuthors extends StatefulWidget {
  const FavAuthors({Key? key}) : super(key: key);

  @override
  State<FavAuthors> createState() => _FavAuthorsState();
}

class _FavAuthorsState extends State<FavAuthors> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    String getAuthors = """
query GetFavAuthors{
 favoriteAuthors{
  name
  picture
  booksCount
}
}

""";

    return Query(
      options: QueryOptions(document: gql(getAuthors)),
      builder: (
        QueryResult result, {
        VoidCallback? refetch,
        FetchMore? fetchMore,
      }) {
        if (result.isLoading) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: height * .1),
            child: const CircularProgressIndicator(),
          );
        }

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 21.0, left: 20.0, top: 22),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Autores Favoritos',
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
              height: 80,
              width: width,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: result.data?['favoriteAuthors'].length,
                itemBuilder: ((context, index) => Container(
                      margin: const EdgeInsets.only(left: 15),
                      child: Card(
                        elevation: 0,
                        shape: const RoundedRectangleBorder(
                          side: BorderSide(
                            color: AppColors.backgroundColor,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        child: SizedBox(
                          height: 69,
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  result.data?['favoriteAuthors'][index]
                                      ['picture'],
                                  fit: BoxFit.cover,
                                  width: 63,
                                  height: 67,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 15, bottom: 5),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 20),
                                        child: Text(
                                          result.data?['favoriteAuthors'][index]
                                              ['name'],
                                          maxLines: 2,
                                          style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16,
                                            color: AppColors.secondaryColor,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '${result.data?['favoriteAuthors'][index]['booksCount']} livros',
                                      style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: AppColors.descriptionColor,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
              ),
            ),
          ],
        );
      },
    );
  }
}
