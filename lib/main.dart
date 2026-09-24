import 'package:flutter/material.dart';
import 'package:recipe_keeper/screens/home/breakfast_options.dart';
import 'package:recipe_keeper/screens/home/dinner_options.dart';
import 'package:recipe_keeper/data/db_helper.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'dart:io';

import 'widgets/search_bar.dart';
import 'widgets/suggestion.dart';
import 'widgets/recipe_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
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
              child: Center(
                child: Text(
                  "Today's Suggestion",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),

            DailySuggestionsWidget(
              left: Builder(
                builder: (context) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const BreakfastOptions(),
                      ),
                    );
                  },

                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        'assets/images/breakfastFood.jpg',
                        fit: BoxFit.cover,
                      ),
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
                ),
              ),

              right: Builder(
                builder: (context) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const DinnerOptions()),
                    );
                  },
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        'assets/images/dinnerFood.png',
                        fit: BoxFit.cover,
                      ),
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
                ),
              ),
            ),

            const RecipeOptionsWidget(),
          ],
        ),
      ),
    );
  }
}
