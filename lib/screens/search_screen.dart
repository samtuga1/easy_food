import 'package:flutter/material.dart';
import 'package:easy_food/widgets/search_bar.dart';

class SearchScreen extends StatefulWidget {
  static String id = 'search_screen';
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
          children: const [
            Padding(
              padding: EdgeInsets.only(top: 8.0, left: 15, right: 15),
              child: SearchBar(),
            ),
            //Expanded(child: FutureBuilder(builder: (context, snapshot) {}))
          ],
        ),
      ),
    );
  }
}
