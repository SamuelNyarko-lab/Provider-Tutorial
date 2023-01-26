// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providertutuorial/models/news_data.dart';

class ArticleDetailPage extends StatelessWidget {
  const ArticleDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    int index = context.read<NewsData>().index;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Article Details',
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Consumer(
                  builder: (context, value, child) {
                    return Text(
                      context.read<NewsData>().map['articles'][index]['title'],
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    context.read<NewsData>().map['articles'][index]
                        ['description'],
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Text(
                  context.read<NewsData>().map['articles'][index]['content'],
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          context.read<NewsData>().map['articles'][index]
                              ['author'],
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Text(
                        context.read<NewsData>().map['articles'][index]
                            ['publishedAt'],
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
