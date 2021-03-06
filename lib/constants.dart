import 'package:easy_food/widgets/food_container.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static TextStyle title = const TextStyle(fontFamily: 'GilroyBold');
  static TextStyle subTitle = const TextStyle(fontFamily: 'GilroyLight');
  static TextStyle ingredientsTextStyle = const TextStyle(
      fontFamily: 'GilroyLight', fontSize: 20, fontWeight: FontWeight.bold);
}

List preference = [
  /*
  imageName: This is the image provider(String) of the image
  title: The title of the preference
  number: This is used to provide the number for each preference
  0: Helps in managing the color of the preference
   */
  {
    'imageName': 'assets/icons/coffee.png',
    'title': 'Breakfast',
    'index': 0,
    0: false,
  },
  {
    'imageName': 'assets/icons/beverage.png',
    'title': 'Drinks',
    'index': 0,
    1: false,
  },
  {
    'imageName': 'assets/icons/snack.png',
    'title': 'Snacks',
    'index': 0,
    2: false,
  },
  {
    'imageName': 'assets/icons/pizza.png',
    'title': 'Dessert',
    'index': 0,
    3: false,
  },
  {
    'imageName': 'assets/icons/soup.png',
    'title': 'Soups',
    'index': 0,
    4: false,
  },
];

List<FoodContainer> bookMarkList = [];
