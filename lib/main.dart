import 'package:easy_food/screens/food_screen.dart';
import 'package:easy_food/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MaterialApp(
    home: const HomeScreen(),
    routes: {
      FoodScreen.id: (context) => const FoodScreen(),
      SearchScreen.id: (context) => const SearchScreen(),
    },
  ));
}
