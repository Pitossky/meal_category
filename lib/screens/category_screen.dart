import 'package:flutter/material.dart';
import 'package:meal_categories/models/dummy_data.dart';
import 'package:meal_categories/widgets/category_item.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(18),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 3/2,
      ),
      children: DUMMY_CATEGORIES.map((category) => CategoryItem(
        id: category.id,
          title: category.title,
        color: category.bgColor,
      )).toList(),
    );
  }
}
