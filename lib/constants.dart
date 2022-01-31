import 'dart:math';
import 'package:easy_food/screens/food_screen.dart';
import 'package:easy_food/services/services.dart';
import 'package:easy_food/widgets/food_container.dart';
import 'package:flutter/material.dart';

double foodRate = foodRateList[Random().nextInt(foodRateList.length)];

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

List<double> foodRateList = [
  3.2,
  4.5,
  2.4,
  5,
  2.4,
  4.5,
  3.2,
  4.2,
  1.9,
  1.9,
  4.4,
  3.1,
  3.5,
  3.3,
  4.1,
  2.8
];

FutureBuilder loadFutureBuilder() {
  return FutureBuilder(
    future: BreakfastServices().getRandomBreakfast(),
    builder: (context, dynamic snapshot) {
      if (snapshot.hasData) {
        List<String> recipeName = snapshot.data[0] ?? [];
        List<String> images = snapshot.data[1] ?? [];
        List<int> foodDuration = snapshot.data[2] ?? [];
        List foodCalories = snapshot.data[3] ?? [];
        List foodCarbs = snapshot.data[4] ?? [];
        List foodFat = snapshot.data[5] ?? [];
        List foodProteins = snapshot.data[6] ?? [];
        List foodInstruction = snapshot.data[7] ?? [];
        return GridView.builder(
          itemCount: BreakfastServices.numberOfFood,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            childAspectRatio: 0.52,
          ),
          itemBuilder: (context, index) {
            return FoodContainer(
              foodLabel: recipeName[index],
              foodImage: images[index],
              time: foodDuration[index],
              foodRate: foodRate.toString(),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FoodScreen(
                      foodName: recipeName[index],
                      image: images[index],
                      foodTime: foodDuration[index],
                      calories: foodCalories[index],
                      protein: foodProteins[index],
                      carbs: foodCarbs[index],
                      fat: foodFat[index],
                      foodInstructions: foodInstruction[index],
                    ),
                  ),
                );
              },
            );
          },
        );
      } else if (snapshot.hasError) {
        return Column(
          children: [
            Image.asset('assets/icons/error.png'),
            const SizedBox(
              height: 10,
            ),
            Text(
              'I don\'t have enough money to buy a plan. I am using a free account so come back later lol😁',
              style: TextStyles.title,
            ),
          ],
        );
      } else {
        return const Align(
          child: CircularProgressIndicator(),
        );
      }
    },
  );
}
