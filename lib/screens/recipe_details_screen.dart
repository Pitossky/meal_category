import 'package:flutter/material.dart';
import 'package:meal_categories/models/dummy_data.dart';
import '../widgets/custom_recipe.dart';

class RecipeDetailsScreen extends StatelessWidget {
  static const routeName = '/recipe-details';

  final Function toggle;
  final Function checkFavorite;

  const RecipeDetailsScreen({
    Key? key,
    required this.toggle,
    required this.checkFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final recipeId = ModalRoute.of(context)!.settings.arguments as String;
    final selected = DUMMY_RECIPE.firstWhere(
      (recipe) => recipe.recipeId == recipeId,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(selected.recipeTitle),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: CircleAvatar(
              backgroundColor: Colors.purple.shade300,
              child: IconButton(
                onPressed: () {
                  toggle(recipeId);
                },
                icon: Icon(
                  checkFavorite(recipeId)
                      ? Icons.favorite :
                  Icons.favorite_border,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(selected.imageUrl),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: Text(
                'Ingredients',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            CustomRecipe(
              selected: selected,
              procedure: selected.recipeIngredients,
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: Text(
                'Cooking steps',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            CustomRecipe(
              selected: selected,
              procedure: selected.cookingSteps,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.delete,
          color: Colors.purple,
        ),
        onPressed: () {
          Navigator.of(context).pop(recipeId);
        },
      ),
    );
  }
}
