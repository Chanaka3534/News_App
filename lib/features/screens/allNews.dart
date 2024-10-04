import 'package:flashnews/features/model/artical_model.dart';
import 'package:flashnews/features/screens/widget/specific_news_tile.dart';
import 'package:flashnews/services/news.dart';
import 'package:flutter/material.dart';

class AllNews extends StatefulWidget {
  String name;
  AllNews({super.key, required this.name});

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  List<ArticalModel> articles = [];
  bool _isloading = true;

  @override
  void initState() {
    getNews();
    super.initState();
  }

  getNews() async {
    News newsclass = News();
    await newsclass.getNews();
    articles = newsclass.news;
    setState(() {
      _isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(225, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(73, 255, 255, 255),
        title: Text(
          widget.name,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
      ),
      body: _isloading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  return NewsTile(
                      description: articles[index].description ?? '',
                      url: articles[index].url ?? '',
                      urlToImage: articles[index].urlToImage ?? '',
                      author: articles[index].author ?? '',
                      publisedAt: articles[index].publisgAt ?? '',
                      title: articles[index].title ?? '');
                },
              ),
            ),
    );
  }
}
