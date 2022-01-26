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
      'icon': Icons.coffee_sharp,
      'title': 'Breakfast',
    },
    {
      'icon': Icons.add,
      'title': 'Ghana',
    },
    {
      'icon': Icons.clear,
      'title': 'Nigeria',
    },
    {
      'icon': Icons.remove,
      'title': 'Guinea',
    },
    {
      'icon': Icons.local_fire_department_outlined,
      'title': 'USA',
    },
    {
      'icon': Icons.local_fire_department_outlined,
      'title': 'Algeria',
    }
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
                          itemCount: 6,
                          itemBuilder: (BuildContext context, index) {
                            return Preference(
                              icon: preference[index]['icon'],
                              title: preference[index]['title'],
                            );
                          }),
                    ),
                  ),
                  Text(
                    'Popular Recipes',
                    style: constants.TextStyles.title.copyWith(fontSize: 30),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
