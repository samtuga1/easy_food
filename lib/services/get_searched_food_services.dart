import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchFoodService {
  late int foodTotalNumber;
  List foodIdSearchList = [];
  List foodNameList = [];
  List foodImageList = [];
  List instructionsList = [];
  List foodDurationList = [];
  List foodIdList = [];
  List calories = [];
  List fats = [];
  List carbohydrates = [];
  List proteins = [];

  final String apiKey = '322a3ecca6d44cfea816de71c7b0853a';
  searchFood(String foodToBeSearched) async {
    try {
      http.Response response = await http.get(
        Uri.parse(
            'https://api.spoonacular.com/recipes/complexSearch?apiKey=$apiKey&query=$foodToBeSearched'),
      );
      dynamic foodData = response.body;
      Map data = json.decode(foodData);
      foodTotalNumber = data['number'];
      for (int i = 0; i < foodTotalNumber; i++) {
        int foodId = data['results'][i]['id'];
        foodIdSearchList.add(foodId);
      }
    } catch (e) {
      print('fetching error');
    }
    for (int i = 0; i < foodIdSearchList.length; i++) {
      try {
        http.Response response = await http.get(
          Uri.parse(
              'https://api.spoonacular.com/recipes/${foodIdSearchList[i]}/information?apiKey=$apiKey&includeNutrition=true'),
        );
        dynamic foodData = response.body;
        Map data = json.decode(foodData);
        String foodName = data['title'];
        foodNameList.add(foodName);
        String foodImage = data['image'];
        foodImageList.add(foodImage);
        int foodDuration = data['readyInMinutes'];
        foodDurationList.add(foodDuration);
        var foodCalories = data['nutrition']['nutrients'][0]['amount'];
        var foodCarbs = data['nutrition']['nutrients'][3]['amount'];
        var foodFat = data['nutrition']['nutrients'][1]['amount'];
        var foodProtein = data['nutrition']['nutrients'][9]['amount'];
        String foodInstruction = data['instructions'];
        instructionsList.add(foodInstruction);
        calories.add(foodCalories);
        carbohydrates.add(foodCarbs);
        fats.add(foodFat);
        proteins.add(foodProtein);
      } catch (p) {
        print('p ---> $p');
      }
    }

    return [
      foodNameList,
      foodImageList,
      foodDurationList,
      calories,
      carbohydrates,
      fats,
      proteins,
      instructionsList,
    ];
  }
}
