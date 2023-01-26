// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providertutuorial/screens/articles.dart';

import 'models/news_data.dart';
import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => NewsData(),
        builder: (context, child) {
          return MaterialApp(
              title: 'Provider Tutorial',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              debugShowCheckedModeBanner: false,
              home: ArticlesPage());
        });
  }
}
