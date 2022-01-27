import 'dart:convert';
import 'package:http/http.dart' as http;

class Services {
  final String apiKey = 'b071243df8c9405ca7e7022e4b0257fa';
  static const int numberOfFood = 50;
  List<String> foodNameList = [];
  getRandomBreakfast() async {
    http.Response response = await http.get(
      Uri.parse(
          'https://api.spoonacular.com/recipes/random?apiKey=$apiKey&number=$numberOfFood&tags=breakfast?'),
    );
    dynamic foodData = response.body;
    Map data = json.decode(foodData);
    for (int i = 0; i < numberOfFood; i++) {
      String foodName = (data['recipes'][i]['title']);
      foodNameList.add(foodName);
    }
  }
}
