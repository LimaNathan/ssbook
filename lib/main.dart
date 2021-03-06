import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ssbook/pages/home_page.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:ssbook/utils/app_colors.dart';
import 'package:ssbook/utils/text_theme.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        statusBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HttpLink httpLink =
        HttpLink('https://us-central1-ss-devops.cloudfunctions.net/GraphQL');
    final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
      GraphQLClient(link: httpLink, cache: GraphQLCache()),
    );
    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SSBOOK',
        theme: ThemeData(
          
          primarySwatch: Colors.purple,
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.primaryColor,
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}
