// ignore_for_file: prefer_final_fields

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';

class NewsData with ChangeNotifier {
  Map<String, dynamic> map = {};

  bool error = false;

  String errorMessage = '';

  int _index = 0;
  int get index => _index;

  setindex(index) {
    _index = index;
  }

  Future<void> get fetchData async {
    // final response = await get(
    //     Uri.parse(
    //         'https://www.dropbox.com/s/sj780qoalidsuy1/articles.json?dl=0'),
    //     headers: {'Content-Type': 'application/json', 'Charset': 'utf-8'});
    final String response = await rootBundle.loadString('assets/articles.json');
    map = await json.decode(response);
    // print(map);

    // if (response.statusCode == 200) {
    //   try {
    //     print(response.body);
    //     map = jsonDecode(response.body);
    //   } on Exception catch (e) {
    //     error = true;
    //     errorMessage = e.toString();
    //     map = {};
    //   }
    // } else {
    //   error = true;
    //   errorMessage = 'Error fetching data';
    //   map = {};
    // }
  }

  initialValues() {
    error = true;
    errorMessage = 'Error fetching data';
    map = {};
  }

  @override
  notifyListeners();
}
