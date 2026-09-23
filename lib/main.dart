import 'package:flutter/material.dart';
import 'widgets/search_bar.dart';

void main() {
  runApp(const RecipeKeeperApp());
}

class RecipeKeeperApp extends StatefulWidget {
  const RecipeKeeperApp({super.key});

  
  @override
  State<RecipeKeeperApp> createState() => _RecipeKeeperAppState();

}

class _RecipeKeeperAppState extends State<RecipeKeeperApp>{

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
        ),
        body: Column(
          children: [
            RecipeSearchBar(
              width: 800,   //width to change later on to non-fixed dependent on screen size
              onChanged: (value) => setState(() => query = value),
              onFilterTap: () {
              },
            ),

            Expanded(
              child: Center(child: Text('Searching for: $query')),
            ),
          ],
        ),
      ),
    );
  }
}


