import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:ssbook/utils/app_colors.dart';

class FavoriteList extends StatefulWidget {
  const FavoriteList({Key? key}) : super(key: key);

  @override
  State<FavoriteList> createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteList> {
  String getBooks = """

query GetFavBooks{
  favoriteBooks{
  cover
  name
  author {
    name
  }
  }
}

""";
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
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
                itemCount: result.data?['favoriteBooks'].length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.only(right: 10, left: 10),
                    width: 136,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            result.data?['favoriteBooks'][index]['cover'],
                            fit: BoxFit.cover,
                            height: 198,
                            width: 136,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          result.data?['favoriteBooks'][index]['name'],
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
                          result.data?['favoriteBooks'][index]['author']
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
          ],
        );
      },
    );
  }
}
