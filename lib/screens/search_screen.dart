import 'package:easy_food/services/get_searched_food_services.dart';
import 'package:easy_food/widgets/food_container.dart';
import 'package:flutter/material.dart';
import 'food_screen.dart';
import 'package:easy_food/constants.dart' as constants;

late List names;
late List image;
late List duration;

class SearchScreen extends StatefulWidget {
  static String id = 'search_screen';
  const SearchScreen({Key? key}) : super(key: key);
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool _textInBar = false;
  String? _foodToBeSearched;
  final _textItem = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 15, right: 15),
              child: TextField(
                controller: _textItem,
                style: constants.TextStyles.title,
                cursorColor: Colors.black54,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _textInBar = true;
                        _foodToBeSearched = _textItem.text;
                      });
                    },
                    icon: const Icon(
                      Icons.search,
                      color: Colors.black54,
                      size: 35,
                    ),
                  ),
                  hintText: 'Search any recipe',
                  hintStyle: constants.TextStyles.title
                      .copyWith(fontSize: 16, color: Colors.black),
                  fillColor: const Color(0xFFf2f2f2),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFFf2f2f2),
                      width: 0,
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(width: 0, color: Color(0xFFf2f2f2)),
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            _textInBar == false
                ? Expanded(
                    child: Image.asset(
                      'assets/icons/search.png',
                    ),
                  )
                : Expanded(
                    child: FutureBuilder(
                      future:
                          SearchFoodService().searchFood(_foodToBeSearched!),
                      builder: (context, dynamic snapshot) {
                        if (snapshot.hasData) {
                          List recipeName = snapshot.data[0] ?? [];
                          names = recipeName;
                          List images = snapshot.data[1] ?? [];
                          image = images;
                          List foodDuration = snapshot.data[2] ?? [];
                          duration = foodDuration;
                          List foodCalories = snapshot.data[3] ?? [];
                          List<dynamic> foodCarbs = snapshot.data[4] ?? [];
                          List foodFat = snapshot.data[5] ?? [];
                          List foodProteins = snapshot.data[6] ?? [];
                          List foodInstruction = snapshot.data[7] ?? [];
                          return GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
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
                                        foodInstructions:
                                            foodInstruction[index],
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
    );
  }
}
