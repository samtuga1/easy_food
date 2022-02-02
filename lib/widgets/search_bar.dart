import 'package:easy_food/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:easy_food/constants.dart' as constants;
import 'package:easy_food/services/get_searched_food_services.dart';

bool textInBar = false;

class SearchBar extends StatefulWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final textItem = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textItem,
      style: constants.TextStyles.subTitle,
      cursorColor: Colors.black54,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {
            textInBar = true;
            setState(() {
              SearchFoodService.foodToBeSearched = textItem.text;
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
            .copyWith(fontSize: 20, color: Colors.black),
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
          borderSide: const BorderSide(width: 0, color: Color(0xFFf2f2f2)),
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}
