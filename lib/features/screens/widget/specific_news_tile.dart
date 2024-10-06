import 'package:cached_network_image/cached_network_image.dart';
import 'package:flashnews/common_widget/rounded_container.dart';
import 'package:flashnews/features/screens/web_view.dart';
import 'package:flashnews/utils/helpers/helper_funcion.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NewsTile extends StatelessWidget {
  String title, author, publisedAt, urlToImage, url, description;
  NewsTile({
    required this.author,
    required this.publisedAt,
    required this.title,
    required this.urlToImage,
    required this.url,
    required this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return WebViewPage(url: url);
          },
        ));
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: CRoundedContainer(
          width: double.infinity,
          height: CHelperFunction.screenSize(context).height * 0.35,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: CachedNetworkImage(
                  width: double.infinity,
                  height: CHelperFunction.screenSize(context).height * 0.175,
                  fit: BoxFit.fill,
                  imageUrl: urlToImage,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        author,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    Text(publisedAt),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
