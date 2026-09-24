import 'package:flutter/material.dart';
import 'package:recipe_keeper/data/db_helper.dart';
import 'package:recipe_keeper/widgets/recipe_categories.dart';

class SnacksOptions extends StatefulWidget {
  const SnacksOptions({super.key});

  @override
  State<SnacksOptions> createState() => _SnacksOptions();
}

class _SnacksOptions extends State<SnacksOptions> {
  @override
  Widget build(BuildContext context) {
    return CategoryRecipeList(
      title: 'Snacks',
      appRecipeTile: 'Our Recipes',
      userRecipeTile: 'Your recipes',
      icon: Icons.free_breakfast,
      fetcher: () => DatabaseHelper.instance.getBreakfastItems(),
      onTapRecipe: (recipe) {},
    );
  }
}
