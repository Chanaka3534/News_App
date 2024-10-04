import 'dart:convert';

import 'package:flashnews/features/model/show_category_model.dart';
import 'package:http/http.dart' as http;

class ShowCategoryNews {
  List<ShowCategoryModel> categories = [];

  Future<void> getCategoryNews(String catogory) async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=us&category=$catogory&apiKey=cdf259d3bc3f4a2ea621e359140e1a32';
    var response = await http.get(Uri.parse(url));
    var jasonData = jsonDecode(response.body);

    if (jasonData['status'] == 'ok') {
      jasonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ShowCategoryModel showCategoryModel = ShowCategoryModel(
              title: element['title'],
              author: element['author'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              publisgAt: element['publishedAt']);
          categories.add(showCategoryModel);
        }
      });
    }
  }
}
