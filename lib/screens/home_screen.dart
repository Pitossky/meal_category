import 'package:flutter/material.dart';
import 'package:meal_categories/screens/category_tabs.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CategoryTabs();
  }
}
