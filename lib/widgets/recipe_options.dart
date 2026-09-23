import 'package:flutter/material.dart';

import 'suggestion.dart';

class RecipeOptionsWidget extends StatelessWidget {
  const RecipeOptionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 12),
          child: Center(
            child: Text(
              "Recipes",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
        ),
        DailySuggestionsWidget(
          left: ClipRRect(          //breakfast
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/breakfastFood.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
          right:ClipRRect(          //lunch
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/placeholder_recipe.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
        ),

        const SizedBox(height: 16),

        DailySuggestionsWidget(       //dinner
          left: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/placeholder_recipe.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
          right: ClipRRect(           //snacks
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/placeholder_recipe.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
        ),
      ],
    );
  }
}
