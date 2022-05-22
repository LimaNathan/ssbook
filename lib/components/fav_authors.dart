import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:ssbook/utils/text_theme.dart';

import '../utils/app_colors.dart';

class FavAuthors extends StatefulWidget {
  final QueryResult result;
  const FavAuthors({Key? key, required this.result}) : super(key: key);

  @override
  State<FavAuthors> createState() => _FavAuthorsState();
}

class _FavAuthorsState extends State<FavAuthors> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 21.0, left: 20.0, top: 22),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Autores Favoritos',
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
          height: 80,
          width: width,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: widget.result.data?['favoriteAuthors'].length,
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
                              widget.result.data?['favoriteAuthors'][index]
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
                                  padding:
                                      const EdgeInsets.only(top: 15, bottom: 5),
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: Text(
                                      widget.result.data?['favoriteAuthors']
                                          [index]['name'],
                                      maxLines: 2,
                                      style: CustomTextTheme().title,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                                Text(
                                  '${widget.result.data?['favoriteAuthors'][index]['booksCount']} livros',
                                  style: CustomTextTheme().subtitle,
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
  }
}
