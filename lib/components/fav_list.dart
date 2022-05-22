import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:ssbook/pages/description_page.dart';
import 'package:ssbook/utils/text_theme.dart';

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
                style: CustomTextTheme().title2,
              ),
              TextButton(
                onPressed: () {},
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'ver todos',
                    style: CustomTextTheme().option,
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
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                var resumedResult = widget.result.data?['favoriteBooks'][index];
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => DescriptionPage(
                      name: resumedResult['name'].toString(),
                      author: resumedResult['author']['name'].toString(),
                      description: resumedResult['description'].toString(),
                      cover: resumedResult['cover'].toString(),
                      isFavorite: resumedResult['isFavorite'],
                    ),
                  ),
                );
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
                      style: CustomTextTheme().title,
                      maxLines: 2,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      widget.result.data?['favoriteBooks'][index]['author']
                          ['name'],
                      style: CustomTextTheme().subtitle,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
