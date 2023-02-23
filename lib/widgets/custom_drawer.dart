import 'package:flutter/material.dart';
import 'package:meal_categories/screens/category_tabs.dart';
import 'package:meal_categories/screens/filters_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 190,
          width: double.infinity,
          color: Colors.purple,
          padding: const EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          child: Text(
            'Cooking Up!',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
        SizedBox(height: 20),
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: GestureDetector(
            onTap: (){
              Navigator.of(context).pushReplacementNamed(CategoryTabs.routeName);
            },
            child: const ListTile(
              leading: Icon(Icons.restaurant),
              title: Text(
                'Menu',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: GestureDetector(
            onTap: (){
              Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
            },
            child: const ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                'Filter',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
