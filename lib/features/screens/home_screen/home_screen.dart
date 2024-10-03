import 'package:carousel_slider/carousel_slider.dart';
import 'package:flashnews/features/model/category_model.dart';
import 'package:flashnews/features/model/slider_model.dart';
import 'package:flashnews/features/screens/home_screen/widget/breaking_news_slider.dart';
import 'package:flashnews/features/screens/home_screen/widget/category_tile.dart';
import 'package:flashnews/features/screens/home_screen/widget/header.dart';
import 'package:flashnews/services/data.dart';
import 'package:flashnews/services/slider_data.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> categories = [];
  List<SliderModel> sliders = [];
  @override
  void initState() {
    categories = getCategories();
    sliders = getSliders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(216, 255, 255, 255),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ///Header
              const Header(),

              ///Breaking News Text
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Breaking News',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Text(
                        'View all',
                        style: TextStyle(fontSize: 16, color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),

              ///Carousel slider
              Padding(
                padding: const EdgeInsets.all(10),
                child: CarouselSlider.builder(
                  itemCount: sliders.length,
                  options: CarouselOptions(
                      height: 200,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      enlargeStrategy: CenterPageEnlargeStrategy.height),
                  itemBuilder: (context, index, realIndex) {
                    String? res = sliders[index].image;
                    String? res1 = sliders[index].name;
                    return buildImage(res!, index, res1!);
                  },
                ),
              ),

              ///CategoryText
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Category',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              ///Category
              SizedBox(
                height: 150,
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
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImage(String urlImage, int index, String name) => Container(
        child: BreakingNewsSliderTile(imageurl: urlImage, title: name),
      );
}
