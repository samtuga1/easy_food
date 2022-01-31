import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchFoodService {
  late int foodTotalNumber;
  final String apiKey = 'b071243df8c9405ca7e7022e4b0257fa';
  searchFood() async {
    try{
      http.Response response = await http.get(
        Uri.parse(
            'https://api.spoonacular.com/recipes/complexSearch?apiKey=$apiKey&query=pasta'),
      );
      dynamic foodData = response.body;
      Map data = json.decode(foodData);
      String foodName = data['results'][0]['title'];
      String foodImage = data['results'][0]['image'];
      foodTotalNumber = data['number'];
    }catch(e){
      print('fetching error');
    }


  }
}
