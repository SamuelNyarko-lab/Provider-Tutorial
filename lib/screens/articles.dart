// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providertutuorial/models/news_data.dart';
import 'package:providertutuorial/screens/articledetails.dart';

class ArticlesPage extends StatefulWidget {
  const ArticlesPage({super.key});

  @override
  State<ArticlesPage> createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  @override
  Widget build(BuildContext context) {
    context.read<NewsData>().fetchData;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Telsa News',
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await context.read<NewsData>().fetchData;
        },
        child: Center(
          child: Consumer<NewsData>(
            builder: (context, value, child) {
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  // itemCount: value.map['articles'].length,
                  itemBuilder: ((context, index) {
                    //  print(value.map.values.length);
                    return GestureDetector(
                        onTap: () {
                          context.read<NewsData>().setindex(index);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ArticleDetailPage()));
                        },
                        child: NewsCard(map: value.map['articles'][index]));
                  }));
            },
          ),
        ),
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  NewsCard({super.key, required this.map});
  Map<String, dynamic> map;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            SizedBox(
              // height: 70,
              width: MediaQuery.of(context).size.width,
              // child: Image.network(map['urlToImage']),
            ),
            Text(
              map['author'],
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
