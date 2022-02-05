import 'package:flutter/material.dart';
import 'package:easy_food/constants.dart' as constants;

import 'bookmark_screen.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List pages = [const HomeScreen(), const BookmarkScreen()];
  int selectedIndex = 0;
  final controller = ScrollController();
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        selectedLabelStyle: constants.TextStyles.title
            .copyWith(color: Colors.black, fontSize: 15),
        unselectedLabelStyle: constants.TextStyles.title.copyWith(fontSize: 15),
        selectedItemColor: Colors.yellow[800],
        type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.red,
        currentIndex: selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 32,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bookmark_outlined,
              size: 32,
            ),
            label: 'Favorites',
          )
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}
