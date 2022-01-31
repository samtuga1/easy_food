import 'package:easy_food/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:easy_food/constants.dart' as constants;
import 'package:easy_food/widgets/preferences.dart';
import 'package:easy_food/constants.dart';
import 'package:easy_food/services/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String mealType = 'Breakfast';

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
                                setState(() {
                                  mealType = preference[index]['title'];
                                  if (constants.preference[index]['title'] ==
                                      'Breakfast') {
                                    BreakfastServices.mealType = 'breakfast';
                                  } else if (constants.preference[index]
                                          ['title'] ==
                                      'Drinks') {
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
                    mealType,
                    style: constants.TextStyles.title.copyWith(fontSize: 30),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: constants.loadFutureBuilder(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
