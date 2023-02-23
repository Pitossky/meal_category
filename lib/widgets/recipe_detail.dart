import 'package:flutter/material.dart';
import 'package:meal_categories/models/recipe.dart';
import 'package:meal_categories/screens/recipe_details_screen.dart';

class RecipeDetail extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function? removeRecipe;

  const RecipeDetail({
    Key? key,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
    this.removeRecipe,
  }) : super(key: key);

  String get complexityText {
    if (complexity == Complexity.simple) {
      return 'Simple';
    } else if (complexity == Complexity.challenging) {
      return 'Challenging';
    } else {
      return 'Hard';
    }
  }

  String get affordabilityText {
    if (affordability == Affordability.cheap) {
      return 'Cheap';
    } else if (affordability == Affordability.pricey) {
      return 'Pricey';
    } else {
      return 'Luxurious';
    }
  }

  void selectRecipe(BuildContext context) {
    Navigator.of(context).pushNamed(
        RecipeDetailsScreen.routeName,
        arguments: id,
    ).then((value) {
      if (value != null && removeRecipe != null){
        removeRecipe!(value);
      }
      //print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => selectRecipe(context),
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 3,
                  right: 5,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                      alignment: Alignment.bottomRight,
                      color: Colors.black54,
                      width: 250,
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                        //softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(width: 5),
                      Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(width: 5),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 5),
                      Text(affordabilityText),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
