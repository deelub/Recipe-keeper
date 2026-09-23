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
          left: const Center(child: Text('Breakfast')),
          right: const Center(child: Text('Lunch')),
        ),

        const SizedBox(height: 16),

        DailySuggestionsWidget(
          left: const Center(child: Text('Dinner')),
          right: const Center(child: Text('Snacks')),
        ),
      ],
    );
  }
}
