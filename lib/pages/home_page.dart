import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:ssbook/components/custom_app_bar.dart';
import 'package:ssbook/components/custom_nav_bar.dart';
import 'package:ssbook/components/fav_authors.dart';
import 'package:ssbook/components/fav_list.dart';
import 'package:ssbook/components/libary.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String getQueries = """
         query GetFavBooks{
            favoriteBooks{
              cover
              name
              author {name}
              description
              isFavorite
            }
            allBooks{
              name
              author{name}
              cover
              category
              id
              isFavorite
              description
            }
            favoriteAuthors{
              name
              picture
              booksCount
            }
          }

""";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Query(
      options: QueryOptions(document: gql(getQueries)),
      builder: (
        QueryResult result, {
        VoidCallback? refetch,
        FetchMore? fetchMore,
      }) {
        if (result.isLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

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
                FavoriteList(result: result),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                    ),
                  ),
                  child: Column(
                    children: [
                      FavAuthors(result: result),
                      Libary(result: result),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: const CustomNavigationBar(),
        );
      },
    );
  }
}
