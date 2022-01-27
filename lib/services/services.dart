import 'dart:convert';
import 'package:http/http.dart' as http;

class Services {
  final String apiKey = 'b071243df8c9405ca7e7022e4b0257fa';
  Future getRandomBreakfast() async {
    http.Response response = await http.get(
      Uri.parse(
          'https://api.spoonacular.com/recipes/random?apiKey=b071243df8c9405ca7e7022e4b0257fa&number=1&tags=breakfast?'),
    );
    dynamic foodData = response.body;
    print(foodData);
    // var data = json.decode(foodData['recipes'][0]['title']); //recipes[0].title
    // print(data);
  }
}
