import 'package:carousel_slider/carousel_slider.dart';
import 'package:flashnews/features/model/artical_model.dart';
import 'package:flashnews/features/model/category_model.dart';
import 'package:flashnews/features/model/slider_model.dart';
import 'package:flashnews/features/screens/allNews.dart';
import 'package:flashnews/features/screens/widget/breaking_news_slider.dart';
import 'package:flashnews/features/screens/widget/category_tile.dart';
import 'package:flashnews/features/screens/widget/header.dart';
import 'package:flashnews/features/screens/widget/trending_news_tile.dart';
import 'package:flashnews/services/data.dart';
import 'package:flashnews/services/news.dart';
import 'package:flashnews/services/slider_data.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> categories = [];
  List<SliderModel> sliders = [];
  List<ArticalModel> articles = [];
  bool _loading = true;
  int _currentIndex = 0;

  @override
  void initState() {
    categories = getCategories();
    getSliders();
    getNews();
    super.initState();
  }

  getNews() async {
    News newsclass = News();
    await newsclass.getNews();
    articles = newsclass.news;
    setState(() {
      _loading = false;
    });
  }

  getSliders() async {
    Sliders slider = Sliders();
    await slider.getSliders();
    sliders = slider.sliders;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(216, 255, 255, 255),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ///Header
                    const Header(),

                    ///Breaking News Text
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Breaking News',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),

                    ///Carousel slider
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: CarouselSlider.builder(
                        itemCount: 5,
                        options: CarouselOptions(
                            height: 150,
                            autoPlay: true,
                            enlargeCenterPage: true,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _currentIndex = index;
                              });
                            },
                            enlargeStrategy: CenterPageEnlargeStrategy.height),
                        itemBuilder: (context, index, realIndex) {
                          String? urlImage = sliders[index].urlToImage;
                          String? name = sliders[index].title;
                          String? url = sliders[index].url;
                          return BreakingNewsSliderTile(
                              url: url ?? "",
                              imageurl: urlImage ?? '',
                              title: name ?? '');
                        },
                      ),
                    ),

                    ///Slider Indicator using SmoothPageIndicator
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: AnimatedSmoothIndicator(
                        activeIndex: _currentIndex,
                        count: 5,
                        effect: const ExpandingDotsEffect(
                          activeDotColor: Colors.blue,
                          dotHeight: 8,
                          dotWidth: 8,
                          dotColor: Colors.grey,
                          expansionFactor: 2,
                        ),
                      ),
                    ),

                    ///CategoryText
                    const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Category',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                    ///Category
                    SizedBox(
                      height: 90,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: categories.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CategoryTile(
                            categoryName: categories[index].categoryName,
                            icon: categories[index].icon,
                          );
                        },
                      ),
                    ),

                    ///Trending News Text
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Trending News',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return AllNews(name: "Trending News");
                                },
                              ));
                            },
                            child: const Text(
                              'View all',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.blue),
                            ),
                          ),
                        ],
                      ),
                    ),

                    ///Trending News
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return TrendinNewsTile(
                          description: articles[index].description ?? "",
                          imageurl: articles[index].urlToImage ?? "",
                          author: articles[index].author ?? "",
                          publishedAt: articles[index].publisgAt ?? "",
                          title: articles[index].title ?? "",
                          url: articles[index].url ?? '',
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
