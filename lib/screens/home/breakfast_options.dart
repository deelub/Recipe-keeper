import 'package:flutter/material.dart';
import 'package:recipe_keeper/data/data_model.dart';
import 'package:recipe_keeper/data/db_helper.dart';


class BreakfastOptions extends StatefulWidget{
  const BreakfastOptions({super.key});

  @override
  State<BreakfastOptions> createState() => _BreakfastOptions();
}

class _BreakfastOptions extends State<BreakfastOptions>{

    List<DataModel> _appRecipes = [];
  List<DataModel> _userRecipes = [];
  bool _isLoading = true;

   @override
  void initState() {
    super.initState();
    _loadRecipes();
  }
  
  Future<void> _loadRecipes() async {
    final all = await DatabaseHelper.instance.getBreakfastItems();

    setState(() {
      _appRecipes = all.take(30).toList();
      _userRecipes = all.skip(30).toList();
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

//  Future<List<DataModel>> DisplayUserRecipes  async {
//    final items = await getBreakfastRecipes();
//     return items.take(30).toList();
// }

//  Future<List<DataModel>> DisplayAppRecipes async{
//    final items = await getBreakfastRecipes();
//   return items.skip(30).toList();

// }