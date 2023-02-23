import 'package:flutter/material.dart';
import 'package:meal_categories/models/dummy_data.dart';
import '../models/recipe.dart';
import '../widgets/recipe_detail.dart';

class CategoryDetailsScreen extends StatefulWidget {
  static const routeName = '/category-details';

  final List<Recipe> availableRecipe;

  const CategoryDetailsScreen({
    Key? key,
    required this.availableRecipe,
  }) : super(key: key);

  @override
  State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {

  late Map<String, String> route;
  String? mealCatTitle;
  String? mealCatId;
  late List<Recipe> recipe;

  @override
  void didChangeDependencies() {
    route = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    mealCatTitle = route['title'];
    mealCatId = route['id'];
    recipe = widget.availableRecipe.where((val){
      return val.recipeCategories.contains(mealCatId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeRecipe(String id){
    setState(() {
      recipe.removeWhere((e) => e.recipeId == id);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(mealCatTitle.toString()),
      ),
      body: ListView.builder(
        itemCount: recipe.length,
          itemBuilder: (BuildContext context, int index){
            return RecipeDetail(
              removeRecipe: _removeRecipe,
              id: recipe[index].recipeId,
              title: recipe[index].recipeTitle,
              imageUrl: recipe[index].imageUrl,
              duration: recipe[index].duration,
              affordability: recipe[index].recipeAffordability,
              complexity: recipe[index].recipeComplexity,
            );
          },
      ),
    );
  }
}
