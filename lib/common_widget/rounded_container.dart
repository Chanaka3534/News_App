import 'package:flutter/material.dart';

class CRoundedContainer extends StatelessWidget {
  const CRoundedContainer(
      {super.key,
      this.width,
      this.height,
      this.radius = 16,
      this.child,
      this.showBorder = false,
      this.boderColor = Colors.blue,
      this.backgroundColor = Colors.white,
      this.padding,
      this.margin,
      this.image});

  final double? width, height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color boderColor, backgroundColor;
  final EdgeInsetsGeometry? padding, margin;
  final DecorationImage? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
          image: image,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius),
          border: showBorder ? Border.all(color: boderColor) : null),
      child: Center(child: child),
    );
  }
}
