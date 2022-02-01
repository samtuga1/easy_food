import 'package:easy_food/services/get_searched_food_services.dart';
import 'package:easy_food/widgets/food_container.dart';
import 'package:flutter/material.dart';
import 'package:easy_food/widgets/search_bar.dart';

import 'food_screen.dart';

class SearchScreen extends StatefulWidget {
  static String id = 'search_screen';
  showContent() {
    return Expanded(
      child: FutureBuilder(
        future: SearchFoodService().searchFood(),
        builder: (context, dynamic snapshot) {
          if (snapshot.hasData) {
            List recipeName = snapshot.data[0] ?? [];
            List images = snapshot.data[1] ?? [];
            List foodDuration = snapshot.data[2] ?? [];
            List foodCalories = snapshot.data[3] ?? [];
            List foodCarbs = snapshot.data[4] ?? [];
            List foodFat = snapshot.data[5] ?? [];
            List foodProteins = snapshot.data[6] ?? [];
            List foodInstruction = snapshot.data[7] ?? [];
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                childAspectRatio: 0.65,
              ),
              itemBuilder: (context, index) {
                return FoodContainer(
                  foodLabel: recipeName[index],
                  foodImage: images[index],
                  time: foodDuration[index],
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
            return const Text('Error');
          } else {
            return const Align(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 8.0, left: 15, right: 15),
              child: SearchBar(),
            ),
            widget.showContent(),
          ],
        ),
      ),
    );
  }
}
