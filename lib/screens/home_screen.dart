import 'package:easy_food/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:easy_food/constants.dart' as constants;
import 'package:easy_food/widgets/preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List preference = [
    {
      'imageName': 'assets/icons/coffee.png',
      'title': 'Breakfast',
    },
    {
      'imageName': 'assets/icons/beverage.png',
      'title': 'Beverages',
    },
    {
      'imageName': 'assets/icons/snack.png',
      'title': 'Snacks',
    },
    {
      'imageName': 'assets/icons/pizza.png',
      'title': 'Dessert',
    },
    {
      'imageName': 'assets/icons/soup.png',
      'title': 'Soups',
    },
  ];

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
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    child: const SearchBar(),
                  ),
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
                            );
                          }),
                    ),
                  ),
                  Text(
                    'Breakfast',
                    style: constants.TextStyles.title.copyWith(fontSize: 30),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  Container(
                                    height: 10,
                                    width: 40,
                                    decoration: const BoxDecoration(
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                              height: 200,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(40),
                              ),
                            ),
                            Text(
                              'Garri',
                              style: constants.TextStyles.title.copyWith(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(40),
                              ),
                            ),
                            Text(
                              'Garri',
                              style: constants.TextStyles.title.copyWith(
                                  fontSize: 24, fontWeight: FontWeight.w100),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
