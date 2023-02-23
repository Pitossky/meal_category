import 'package:flutter/material.dart';

class FavoriteRecipe extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function(bool) filterFnc;
  final bool value;

  const FavoriteRecipe({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.filterFnc,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      activeColor: Colors.purple,
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
      value: value,
      subtitle: Text(
        subtitle,
        style: const TextStyle(fontWeight: FontWeight.w700),
      ),
      onChanged: filterFnc,
    );
  }
}
