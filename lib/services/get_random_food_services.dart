import 'dart:convert';
import 'package:http/http.dart' as http;

//This class will manage all networking services
class BreakfastServices {
  static String mealType = 'breakfast';
  final String apiKey = '0f33ebe71c364d11989456eb69a46a31';
  static const int numberOfFood = 1;
  List<String> instructionsList = [];
  List<String> foodNameList = [];
  List<String> foodImageList = [];
  List<int> foodDurationList = [];
  List<int> foodIdList = [];
  List calories = [];
  List fats = [];
  List carbohydrates = [];
  List proteins = [];

  /*This class will manage all networking services which includes fetching of the data from the API and decoding
  the JSON file that comes and then returning a list of data*/
  Future<List> getRandomBreakfast() async {
    try {
      http.Response response = await http.get(
        Uri.parse(
            'https://api.spoonacular.com/recipes/random?apiKey=$apiKey&number=$numberOfFood&tags=$mealType'),
      );

      dynamic foodData = response.body;
      Map data = json.decode(foodData);
      for (int i = 0; i < numberOfFood; i++) {
        String foodName = (data['recipes'][i]['title']);
        String foodImage = (data['recipes'][i]['image']);
        int foodDuration = (data['recipes'][i]['readyInMinutes']);
        int foodId = (data['recipes'][i]['id']);
        String instruction = (data['recipes'][i]['instructions']);
        instructionsList.add(instruction);
        foodImageList.add(foodImage);
        foodNameList.add(foodName);
        foodDurationList.add(foodDuration);
        foodIdList.add(foodId);
      }
    } catch (e) {
      print('not working');
    }
    for (int id in foodIdList) {
      http.Response response = await http.get(
        Uri.parse(
            'https://api.spoonacular.com/recipes/$id/nutritionWidget.json?apiKey=$apiKey'),
      );
      try {
        dynamic foodData = response.body;
        Map data = json.decode(foodData);
        var foodCalories = data['calories'];
        var foodCarbs = data['carbs'];
        var foodFat = data['fat'];
        var foodProtein = data['protein'];
        calories.add(foodCalories);
        carbohydrates.add(foodCarbs);
        fats.add(foodFat);
        proteins.add(foodProtein);
      } catch (e) {
        print(e);
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
