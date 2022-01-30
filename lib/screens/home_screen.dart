import "dart:math";
import 'package:easy_food/screens/food_screen.dart';
import 'package:easy_food/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:easy_food/constants.dart' as constants;
import 'package:easy_food/widgets/preferences.dart';
import 'package:easy_food/widgets/food_container.dart';
import 'package:easy_food/constants.dart';
import 'package:easy_food/services/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double foodRate =
      constants.foodRateList[Random().nextInt(constants.foodRateList.length)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 15.0, left: 15, top: 20),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Make your own food,',
                    style: constants.TextStyles.title.copyWith(
                      fontSize: 30,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'stay at ',
                        style: constants.TextStyles.title.copyWith(
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        'home',
                        style: constants.TextStyles.title
                            .copyWith(fontSize: 30, color: Colors.yellow),
                      ),
                    ],
                  ),
                  //This container manages the search bar
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    child: const SearchBar(),
                  ),
                  //This container manages the preferences
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 30.0),
                    child: SizedBox(
                      height: 135,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (BuildContext context, index) {
                            return Preference(
                              imageName: preference[index]['imageName'],
                              title: preference[index]['title'],
                              onPressed: () {
                                if (constants.preference[index]['title'] ==
                                    'Breakfast') {
                                  BreakfastServices.mealType = 'breakfast';
                                } else if (constants.preference[index]
                                        ['title'] ==
                                    'Beverages') {
                                  BreakfastServices.mealType = 'drink';
                                } else if (constants.preference[index]
                                        ['title'] ==
                                    'Dessert') {
                                  BreakfastServices.mealType = 'dessert';
                                } else if (constants.preference[index]
                                        ['title'] ==
                                    'Snacks') {
                                  BreakfastServices.mealType = 'snack';
                                } else if (constants.preference[index]
                                        ['title'] ==
                                    'Soups') {
                                  BreakfastServices.mealType = 'soup';
                                }
                                setState(() {
                                  constants.preference[index][index] =
                                      true; //uses boolean operator to change color
                                  for (var element in constants.preference) {
                                    //Below is the code to set other preferences to the initial colour rather than yellow
                                    if (element['number'] != index) {
                                      for (var i = 1;
                                          i < constants.preference.length;
                                          i++) {
                                        element[index - i] = false;
                                        element[index + i] = false;
                                      }
                                    }
                                  }
                                });
                              },
                              preferenceColor: constants.preference[index]
                                  [index],
                            );
                          }),
                    ),
                  ),
                  //A text to display the label of the preference
                  Text(
                    'Breakfast',
                    style: constants.TextStyles.title.copyWith(fontSize: 30),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: FutureBuilder(
                  future: BreakfastServices().getRandomBreakfast(),
                  builder: (context, dynamic snapshot) {
                    if (snapshot.hasData) {
                      List<String> recipes = snapshot.data[0] ?? [];
                      List<String> images = snapshot.data[1] ?? [];
                      List<int> foodDuration = snapshot.data[2] ?? [];
                      List foodCalories = snapshot.data[3] ?? [];
                      List foodCarbs = snapshot.data[4] ?? [];
                      List foodFat = snapshot.data[5] ?? [];
                      List foodProteins = snapshot.data[6] ?? [];
                      List foodInstruction = snapshot.data[7] ?? [];
                      return GridView.builder(
                        itemCount: BreakfastServices.numberOfFood,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          childAspectRatio: 0.52,
                        ),
                        itemBuilder: (context, index) {
                          return FoodContainer(
                            foodLabel: recipes[index],
                            foodImage: images[index],
                            time: foodDuration[index],
                            foodRate: foodRate.toString(),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FoodScreen(
                                    foodName: recipes[index],
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
                            style: constants.TextStyles.title,
                          ),
                        ],
                      );
                    } else {
                      return const Align(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
