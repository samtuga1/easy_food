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
  @override
  Widget build(BuildContext context) {
    BreakfastServices().getRandomBreakfast();
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
                    List? recipes = snapshot.data[0];
                    List? images = snapshot.data[1];
                    List? foodDuration = snapshot.data[2];
                    if (snapshot.hasData) {
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
                              foodLabel: recipes![index],
                              foodImage: '${images![index]}',
                              time: foodDuration![index],
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FoodScreen(
                                          foodName: recipes[index],
                                          image: '${images[index]}')),
                                );
                              });
                        },
                      );
                    } else if (snapshot.hasError) {
                      return const Text('Failed to Load');
                    } else {
                      return const Align(child: CircularProgressIndicator());
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
