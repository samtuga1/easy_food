import 'dart:convert';
import 'package:http/http.dart' as http;

class BreakfastServices {
  final String apiKey = '1ccfc3183728482f908ccb2e6d8e2fe6';
  static const int numberOfFood = 20;
  List<String> foodNameList = [];
  List<String> foodImageList = [];
  List<int> foodDurationList = [];
  Future<List> getRandomBreakfast() async {
    http.Response response = await http.get(
      Uri.parse(
          'https://api.spoonacular.com/recipes/random?apiKey=$apiKey&number=$numberOfFood&tags=breakfast?'),
    );
    try {
      dynamic foodData = response.body;
      Map data = json.decode(foodData);
      for (int i = 0; i < numberOfFood; i++) {
        String foodName = (data['recipes'][i]['title']);
        String foodImage = (data['recipes'][i]['image']);
        int foodDuration =
            (data['recipes'][i]['readyInMinutes']); //recipes[1].readyInMinutes
        foodImageList.add(foodImage);
        foodNameList.add(foodName);
        foodDurationList.add(foodDuration);
      }
    } catch (e) {
      print(e);
    }
    return [foodNameList, foodImageList, foodDurationList];
  }
}
