import 'package:flutter/material.dart';

class RecipeSearchBar extends StatelessWidget {
  final String hintText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onFilterTap;
  final double? width;              
  final Color accentColor;             
  final bool center;                   

  const RecipeSearchBar({
    super.key,
    this.hintText = 'Search for a recipe',
    this.onChanged,
    this.onFilterTap,
    this.width,                         
    this.accentColor = const Color.fromARGB(255, 25, 125, 7),
    this.center = true,
  });

  @override
  Widget build(BuildContext context) {
    final searchField = SizedBox(
      width: width,                     
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          prefixIcon: Icon(Icons.search, color: accentColor),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: accentColor, width: 2),
          ),
        ),
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(16),
      child: center ? Center(child: searchField) : searchField,
    );
  }
}