import 'package:flutter/material.dart';
import 'package:meal_categories/models/recipe.dart';
import 'package:meal_categories/screens/category_screen.dart';
import 'package:meal_categories/screens/favorites_screen.dart';
import 'package:meal_categories/widgets/custom_drawer.dart';

class CategoryTabs extends StatefulWidget {
  static const routeName = '/category-tabs';

  final List<Recipe>? favorites;

  const CategoryTabs({
    Key? key,
    this.favorites,
  }) : super(key: key);

  @override
  State<CategoryTabs> createState() => _CategoryTabsState();
}

class _CategoryTabsState extends State<CategoryTabs> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(title: const Text('Meal Categories'),
            bottom: const TabBar(
              indicatorColor: Colors.grey,
              tabs: [
                Tab(
                  icon: Icon(Icons.category),
                  text: 'Categories',
                ),
                Tab(
                  icon: Icon(Icons.star),
                  text: 'Favorites',
                )
              ],
            ),
          ),
          drawer: const Drawer(
            child: CustomDrawer(),
          ),
          body: TabBarView(
            children: [
              const CategoryScreen(),
              FavoritesScreen(favorites: widget.favorites ?? []),
            ],
          ),
        ),
    );
  }
}
