import 'package:flashnews/common_widget/rounded_container.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final categoryName;
  final icon;

  const CategoryTile({
    super.key,
    this.categoryName,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          CRoundedContainer(
            width: 65,
            height: 65,
            radius: 100,
            child: Center(
              child: Icon(
                icon,
                size: 40,
                weight: 300,
              ),
            ),
          ),
          Text(
            categoryName,
            style: const TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
