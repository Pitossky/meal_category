import 'package:flutter/material.dart';

import '../models/recipe.dart';

class CustomRecipe extends StatelessWidget {
  const CustomRecipe({
    Key? key,
    required this.selected,
    required this.procedure,
  }) : super(key: key);

  final Recipe selected;
  final List<String> procedure;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 300,
      margin: const EdgeInsets.only(bottom: 10),
      child: ListView.builder(
        itemCount: procedure.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Card(
              color: Colors.grey[200],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 12,
                ),
                child: Text(
                  procedure[index],
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}