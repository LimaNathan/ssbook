import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ssbook/pages/home_page.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:ssbook/provider/id.dart';
import 'package:ssbook/utils/app_colors.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(Provider(create: (context) => ID(), child: const MyApp()));
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
        routes: {
          '/': (context) => const HomePage(),
        },
      ),
    );
  }
}
