import 'package:flashnews/common_widget/rounded_container.dart';
import 'package:flashnews/utils/helpers/helper_funcion.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BreakingNewsSliderTile extends StatelessWidget {
  String imageurl;
  String title;
  BreakingNewsSliderTile(
      {super.key, required this.imageurl, required this.title});

  @override
  Widget build(BuildContext context) {
    final size = CHelperFunction.screenSize(context);
    return CRoundedContainer(
      width: size.width * 0.72,
      backgroundColor: Colors.black,
      image: DecorationImage(
          fit: BoxFit.fill,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.55),
            BlendMode.darken,
          ),
          image: NetworkImage(imageurl)),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(title,
              style: const TextStyle(color: Colors.white),
              maxLines: 3,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis),
        ),
      ),
    );
  }
}
