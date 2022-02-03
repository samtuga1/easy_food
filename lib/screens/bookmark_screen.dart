import 'package:flutter/material.dart';
import 'package:easy_food/constants.dart' as constants;

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({Key? key}) : super(key: key);

  @override
  _BookmarkScreenState createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: constants.bookMarkList),
    );
  }
}
