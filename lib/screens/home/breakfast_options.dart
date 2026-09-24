import 'package:flutter/material.dart';
import 'package:recipe_keeper/data/data_model.dart';
import 'package:recipe_keeper/data/db_helper.dart';
import 'package:recipe_keeper/widgets/recipe_categories.dart';

class BreakfastOptions extends StatefulWidget {
  const BreakfastOptions({super.key});

  @override
  State<BreakfastOptions> createState() => _BreakfastOptions();
}

class _BreakfastOptions extends State<BreakfastOptions> {
  List<DataModel> _appRecipes = [];
  List<DataModel> _userRecipes = [];
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return CategoryRecipeList(
      title: 'Breakfast',
      appRecipeTile: 'Our Recipes',
      userRecipeTile: 'Your recipes',
      icon: Icons.free_breakfast,
      fetcher: () => DatabaseHelper.instance.getBreakfastItems(),
      onTapRecipe: (recipe) {},
    );
  }
}
