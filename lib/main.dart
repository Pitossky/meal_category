import 'package:flutter/material.dart';
import 'package:meal_categories/models/dummy_data.dart';
import 'package:meal_categories/models/recipe.dart';
import 'package:meal_categories/screens/category_details_screen.dart';
import 'package:meal_categories/screens/category_tabs.dart';
import 'package:meal_categories/screens/filters_screen.dart';
import 'package:meal_categories/screens/home_screen.dart';
import 'package:meal_categories/screens/recipe_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'vegan': false,
    'lactose': false,
    'vegetarian': false,
  };

  List<Recipe> _availableMeals = DUMMY_RECIPE;
  List<Recipe> _favotiteRecipe = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_RECIPE.where((element) {
        if (_filters['gluten'] as bool && !element.isGlutenFree) {
          return false;
        }
        if (_filters['vegan'] as bool && !element.isVegan) {
          return false;
        }
        if (_filters['lactose'] as bool && !element.isLactoseFree) {
          return false;
        }
        if (_filters['vegetarian'] as bool && !element.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toggleFavorites(String id) {
    final existingRecipe =
        _favotiteRecipe.indexWhere((recipe) => recipe.recipeId == id);
    if (existingRecipe >= 0) {
      setState(() {
        _favotiteRecipe.removeAt(existingRecipe);
      });
    } else {
      setState(() {
        _favotiteRecipe
            .add(DUMMY_RECIPE.firstWhere((recipe) => recipe.recipeId == id));
      });
    }
  }

  bool _checkFavorite(String id) {
    return _favotiteRecipe.any((element) => element.recipeId == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal Categories',
      theme: ThemeData(
        canvasColor: const Color.fromRGBO(255, 224, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                  fontWeight: FontWeight.w600,
                  fontSize: 18),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.purple,
        ).copyWith(
          secondary: Colors.grey.shade300,
          primary: Colors.purple,
        ),
      ),
      //home: const HomeScreen(),
      initialRoute: '/',
      routes: {
        '/': (_) => HomeScreen(),
        CategoryDetailsScreen.routeName: (_) =>
            CategoryDetailsScreen(availableRecipe: _availableMeals),
        RecipeDetailsScreen.routeName: (_) => RecipeDetailsScreen(
              toggle: _toggleFavorites,
              checkFavorite: _checkFavorite,
            ),
        CategoryTabs.routeName: (_) => CategoryTabs(favorites: _favotiteRecipe),
        FiltersScreen.routeName: (_) => FiltersScreen(
              currentFilters: _filters,
              setFilter: _setFilters,
            ),
      },
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (_) => CategoryDetailsScreen(availableRecipe: _availableMeals),
      ),
    );
  }
}
