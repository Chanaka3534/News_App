import 'dart:convert';

import 'package:flashnews/features/model/artical_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticalModel> news = [];

  Future<void> getNews() async {
    String url =
        'https://newsapi.org/v2/everything?q=bitcoin&apiKey=cdf259d3bc3f4a2ea621e359140e1a32';
    var response = await http.get(Uri.parse(url));
    var jasonData = jsonDecode(response.body);

    if (jasonData['status'] == 'ok') {
      jasonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticalModel articalModel = ArticalModel(
              title: element['title'],
              author: element['author'],
              content: element['content'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              publisgAt: element['publishedAt']);
          news.add(articalModel);
        }
      });
    }
  }
}
