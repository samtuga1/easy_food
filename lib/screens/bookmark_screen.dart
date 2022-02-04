import 'package:flutter/material.dart';
import 'package:easy_food/constants.dart' as constants;

class BookmarkScreen extends StatefulWidget {
  static String id = 'bookmark_screen.dart';
  const BookmarkScreen({Key? key}) : super(key: key);

  @override
  _BookmarkScreenState createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Favorites',
                    style: constants.TextStyles.title
                        .copyWith(fontSize: 30, color: Colors.amberAccent),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: constants.bookMarkList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.61,
                  ),
                  itemBuilder: (context, index) {
                    return constants.bookMarkList[index];
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
