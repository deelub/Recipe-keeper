class DataModel {

  final int id;
  final String recipeName;
  final String prepTime;
  final int servingSize;
  final String ingredients;
  final String instructions;

  DataModel({
    required this.id,
    required this.recipeName,
    required this.prepTime,
    required this.servingSize,
    required this.ingredients,
    required this.instructions,

  });

    factory DataModel.fromMap(Map<String, dynamic> map) { //Data model objectv to extract data from db
    return DataModel(
      id: map['id'] as int,
      recipeName: map['recipe name'] as String,
      prepTime: map['prep time'] as String,
      servingSize: map['serving size'] as int,
      ingredients: map['ingredients'] as String,
      instructions: map['instructions'] as String
    );
  }
}