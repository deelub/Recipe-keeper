import 'package:flutter/material.dart';

import 'widgets/search_bar.dart';
import 'widgets/suggestion.dart';
import 'widgets/recipe_options.dart';

void main() {
  runApp(const RecipeKeeperApp());
}

class RecipeKeeperApp extends StatefulWidget {
  const RecipeKeeperApp({super.key});

  @override
  State<RecipeKeeperApp> createState() => _RecipeKeeperAppState();
}

class _RecipeKeeperAppState extends State<RecipeKeeperApp> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFF7F7F9),

        appBar: AppBar(
          title: const Text('Recipe Keeper'),
          backgroundColor: const Color.fromARGB(255, 25, 125, 7),
          foregroundColor: Colors.white,
          elevation: 0,

          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
              child: Row(
                children: [
                  Expanded(
                    //recipe serach bar
                    child: RecipeSearchBar(
                      onChanged: (value) {
                        setState(() {
                          query = value;
                        });
                      },
                      onFilterTap: () {},
                    ),
                  ),

                  const SizedBox(width: 8),

                  IconButton(
                    //icon for adding to recipe db
                    icon: const Icon(
                      Icons.add_circle,
                      color: Colors.white,
                      size: 34,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 16, 16, 12),
              child : Center(child: Text(
                "Today's Suggestion",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),)
              
            ),

            DailySuggestionsWidget(
              left: Container(child: const Center(child: Text('Lunch'))),
              right: Container(child: const Center(child: Text('Dinner'))),
            ),

            const RecipeOptionsWidget(),
          ],
        ),
      ),
    );
  }
}
