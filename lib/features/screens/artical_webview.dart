import 'package:cached_network_image/cached_network_image.dart';
import 'package:flashnews/utils/helpers/helper_funcion.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ArticalView extends StatefulWidget {
  String title, author, publishedAt, urlToImage, description, url;

  ArticalView({
    super.key,
    required this.author,
    required this.description,
    required this.publishedAt,
    required this.title,
    required this.url,
    required this.urlToImage,
  });

  @override
  State<ArticalView> createState() => _ArticalWebviewState();
}

class _ArticalWebviewState extends State<ArticalView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Flash',
                style: GoogleFonts.protestRevolution(
                    textStyle: const TextStyle(
                        fontSize: 28, fontWeight: FontWeight.w500))),
            Text('News',
                style: GoogleFonts.protestRevolution(
                    textStyle: const TextStyle(
                        color: Colors.blue,
                        fontSize: 28,
                        fontWeight: FontWeight.w500))),
          ],
        ),
      ),
      body: Column(
        children: [
          ///Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              widget.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
          ),

          ///Author and published date
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.author,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(widget.publishedAt),
              ],
            ),
          ),

          ///Image
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: widget.urlToImage,
                fit: BoxFit.fill,
                height: CHelperFunction.screenHeight(context) * 0.25,
                width: double.infinity,
              ),
            ),
          ),

          ///Description
        ],
      ),
    );
  }
}
