import 'package:flutter/material.dart';
import 'package:recipe_keeper/data/data_model.dart';
import 'package:recipe_keeper/data/db_helper.dart';
import 'package:recipe_keeper/widgets/recipe_categories.dart';

class DinnerOptions extends StatefulWidget {
  const DinnerOptions({super.key});

  @override
  State<DinnerOptions> createState() => _DinnerOptions();
}

class _DinnerOptions extends State<DinnerOptions> {
  @override
  Widget build(BuildContext context) {
    return CategoryRecipeList(
      title: 'Dinner',
      appRecipeTile: 'Our Recipes',
      userRecipeTile: 'Your recipes',
      icon: Icons.free_breakfast,
      fetcher: () => DatabaseHelper.instance.getBreakfastItems(),
      onTapRecipe: (recipe) {},
    );
  }
}
