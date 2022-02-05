import 'package:flutter/material.dart';
import 'package:scroll_bottom_navigation_bar/scroll_bottom_navigation_bar.dart';

import 'bookmark_screen.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List pages = [const HomeScreen(), BookmarkScreen()];
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
