import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_categories/screens/category_tabs.dart';
import 'package:meal_categories/widgets/custom_drawer.dart';
import 'package:meal_categories/widgets/favorite_recipe.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function setFilter;
  final Map<String, bool> currentFilters;

  const FiltersScreen({
    Key? key,
    required this.setFilter,
    required this.currentFilters,
  }) : super(key: key);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'] as bool;
    _vegetarian = widget.currentFilters['vegetarian'] as bool;
    _lactoseFree = widget.currentFilters['lactose'] as bool;
    _vegan = widget.currentFilters['vegan'] as bool;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
        actions: [
          IconButton(
            onPressed: () async {
              Map<String, bool> selectedFilters = {
                'gluten': _glutenFree,
                'vegan': _vegan,
                'lactose': _lactoseFree,
                'vegetarian': _vegetarian,
              };
              widget.setFilter(selectedFilters);
              //await Navigator.of(context).pushReplacementNamed(CategoryTabs.routeName);
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      drawer: const Drawer(
        child: CustomDrawer(),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust Recipe Selection',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: [
                FavoriteRecipe(
                    title: 'Gluten-free',
                    subtitle: 'Only include gluten-free meals',
                    value: _glutenFree,
                    filterFnc: (val) {
                      setState(() {
                        _glutenFree = val;
                      });
                    }),
                FavoriteRecipe(
                    title: 'Vegan',
                    subtitle: 'Only include Vegan',
                    value: _vegan,
                    filterFnc: (val) {
                      setState(() {
                        _vegan = val;
                      });
                    }),
                FavoriteRecipe(
                    title: 'Vegetarian',
                    subtitle: 'Only include Vegetables',
                    value: _vegetarian,
                    filterFnc: (val) {
                      setState(() {
                        _vegetarian = val;
                      });
                    }),
                FavoriteRecipe(
                    title: 'Lactose-free',
                    subtitle: 'Only include lactose-free meals',
                    value: _lactoseFree,
                    filterFnc: (val) {
                      setState(() {
                        _lactoseFree = val;
                      });
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
