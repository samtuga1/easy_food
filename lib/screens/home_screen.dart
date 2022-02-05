import 'package:easy_food/screens/search_screen.dart';
import 'package:easy_food/widgets/food_container.dart';
import 'package:flutter/material.dart';
import 'package:easy_food/constants.dart' as constants;
import 'package:easy_food/widgets/preferences.dart';
import 'package:easy_food/constants.dart';
import 'package:easy_food/services/get_random_food_services.dart';
import 'food_screen.dart';
import 'package:scroll_bottom_navigation_bar/scroll_bottom_navigation_bar.dart';
import 'package:easy_food/screens/bookmark_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String mealType = 'Breakfast';
  bool searchFoodPressed = false;
  final controller = ScrollController();
  int selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List pages = [
    HomeScreen(),
    BookmarkScreen()
  ];

  @override
  Widget build(BuildContext context) {
    BreakfastServices().getRandomBreakfast();
    return Scaffold(
      backgroundColor: Colors.white,
      body: ,
      bottomNavigationBar: ScrollBottomNavigationBar(
          currentIndex: selectedIndex,
          controller: controller,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark_outlined), label: 'Favorites')
          ],
          onTap: _onItemTapped),
    );
  }
}
