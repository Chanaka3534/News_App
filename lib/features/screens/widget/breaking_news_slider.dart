import 'package:cached_network_image/cached_network_image.dart';
import 'package:flashnews/common_widget/rounded_container.dart';
import 'package:flashnews/features/screens/web_view.dart';
import 'package:flashnews/utils/helpers/helper_funcion.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BreakingNewsSliderTile extends StatelessWidget {
  String imageurl, title, url;
  BreakingNewsSliderTile(
      {super.key,
      required this.imageurl,
      required this.title,
      required this.url});

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
      child: CRoundedContainer(
        width: size.width * 0.72,
        backgroundColor: Colors.black,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: imageurl,
                fit: BoxFit.fill,
                width: double.infinity,
                height: double.infinity,
                colorBlendMode: BlendMode.darken,
                color: Colors.black.withOpacity(0.55),

                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: Colors.red,
                ), // If there's an error
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  title,
                  style: const TextStyle(color: Colors.white),
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
