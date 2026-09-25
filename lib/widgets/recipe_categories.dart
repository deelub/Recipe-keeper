import 'package:flutter/material.dart';
import 'package:recipe_keeper/data/data_model.dart';

class CategoryRecipeList extends StatefulWidget {
  const CategoryRecipeList({
    super.key,
    required this.title,
    required this.appRecipeTile,
    required this.userRecipeTile,
    required this.icon,
    required this.fetcher,
    this.pageSize = 30,
    this.onTapRecipe,
  });

  final String title;

  final String appRecipeTile;

  final String userRecipeTile;

  final IconData icon;

  final Future<List<DataModel>> Function() fetcher;

  final int pageSize;

  final void Function(DataModel recipe)? onTapRecipe;

  @override
  State<CategoryRecipeList> createState() => _CategoryRecipeListState();
}

class _CategoryRecipeListState extends State<CategoryRecipeList> {
  List<DataModel> _primary = [];
  List<DataModel> _secondary = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void didUpdateWidget(covariant CategoryRecipeList oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.fetcher != widget.fetcher) {
      _load();
    }
  }

  Future<void> _load() async {
    setState(() => _isLoading = true);
    try {
      print('Fetching recipes...');
      final all = await widget.fetcher();
      print('Got ${all.length} recipes');
      if (!mounted) return;
      setState(() {
        _primary = all.take(widget.pageSize).toList();
        _secondary = all.skip(widget.pageSize).toList();
        _isLoading = false;
      });
    } catch (e, st) {
      print('ERROR loading recipes: $e');
      print(st);
      if (!mounted) return;
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_primary.isEmpty && _secondary.isEmpty) {
      return const Center(child: Text('No recipes found'));
    }

    return RefreshIndicator(
      onRefresh: _load,
      child: ListView(
        children: [
          _sectionHeader(widget.appRecipeTile),
          ..._primary.map(_buildTile),

          if (_secondary.isNotEmpty) ...[
            _sectionHeader(widget.userRecipeTile),
            ..._secondary.map(_buildTile),
          ],
        ],
      ),
    );
  }

  Widget _sectionHeader(String text) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        text,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildTile(DataModel recipe) {
    return ListTile(
      leading: Icon(widget.icon),
      title: Text(recipe.recipeName),
      subtitle: Text('${recipe.prepTime} min · ${recipe.servingSize} servings'),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () => widget.onTapRecipe?.call(recipe),
    );
  }
}
