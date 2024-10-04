import 'package:cached_network_image/cached_network_image.dart';
import 'package:flashnews/common_widget/rounded_container.dart';
import 'package:flashnews/features/screens/web_view.dart';
import 'package:flashnews/utils/helpers/helper_funcion.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TrendinNewsTile extends StatelessWidget {
  String imageurl, title, description, author, publishedAt, url;
  TrendinNewsTile(
      {super.key,
      required this.description,
      required this.imageurl,
      required this.author,
      required this.url,
      required this.publishedAt,
      required this.title});

  @override
  Widget build(BuildContext context) {
    final size = CHelperFunction.screenSize(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return WebViewPage(url: url);
          },
        ));
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: CRoundedContainer(
          height: size.height * 0.18,
          width: double.infinity,
          backgroundColor: Colors.white,
          child: Stack(
            children: [
              /// CachedNetworkImage for loading and caching images
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  imageUrl: imageurl,
                  fit: BoxFit.fill,
                  width: size.width * 0.92,
                  height: size.height * 0.165,
                  colorBlendMode: BlendMode.darken,
                  color: Colors.black.withOpacity(0.55),
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    color: Colors.red,
                  ), // If there's an error
                ),
              ),

              /// Title
              Positioned(
                top: 20,
                left: 10,
                right: 10,
                child: Text(
                  title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              /// Author
              Positioned(
                top: 95,
                left: 20,
                child: Text(
                  author,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              /// Published Date
              Positioned(
                top: 115,
                left: 20,
                child: Text(
                  publishedAt,
                  style: const TextStyle(color: Colors.white),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
