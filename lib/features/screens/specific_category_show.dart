import 'package:flashnews/features/model/show_category_model.dart';
import 'package:flashnews/features/screens/widget/specific_news_tile.dart';
import 'package:flashnews/services/show_category_news.dart';
import 'package:flutter/material.dart';

class ShowCategory extends StatefulWidget {
  String name;
  ShowCategory({super.key, required this.name});

  @override
  State<ShowCategory> createState() => _ShowCategoryState();
}

class _ShowCategoryState extends State<ShowCategory> {
  List<ShowCategoryModel> categories = [];
  bool _isloading = true;

  @override
  void initState() {
    getCategoryNews();
    super.initState();
  }

  getCategoryNews() async {
    ShowCategoryNews showCategory = ShowCategoryNews();
    await showCategory.getCategoryNews(widget.name.toLowerCase());
    categories = showCategory.categories;
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
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return NewsTile(
                      description: categories[index].description ?? '',
                      url: categories[index].url ?? '',
                      urlToImage: categories[index].urlToImage ?? '',
                      author: categories[index].author ?? '',
                      publisedAt: categories[index].publisgAt ?? '',
                      title: categories[index].title ?? '');
                },
              ),
            ),
    );
  }
}
