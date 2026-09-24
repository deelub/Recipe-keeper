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
          left: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset('assets/images/breakfastFood.jpg', fit: BoxFit.cover),
              const Center(
                child: Text(
                  'Breakfast',
                  style: TextStyle(
                    color: Color.fromARGB(255, 9, 9, 9),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          right: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset('assets/images/lunchFood.png', fit: BoxFit.cover),
              const Center(
                child: Text(
                  'Lunch',
                  style: TextStyle(
                    color: Color.fromARGB(255, 9, 9, 9),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        DailySuggestionsWidget(
          left: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset('assets/images/dinnerFood.png', fit: BoxFit.cover),
              const Center(
                child: Text(
                  'Dinner',
                  style: TextStyle(
                    color: Color.fromARGB(255, 9, 9, 9),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          right: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset('assets/images/snacksFood.jpg', fit: BoxFit.cover),
              const Center(
                child: Text(
                  'Snacks',
                  style: TextStyle(
                    color: Color.fromARGB(255, 9, 9, 9),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
