import 'package:flutter/material.dart';
import 'package:easy_food/constants.dart' as constants;

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: constants.TextStyles.subTitle,
      cursorColor: Colors.black54,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
            color: Colors.black54,
            size: 35,
          ),
        ),
        hintText: 'Search any recipe',
        hintStyle: constants.TextStyles.subTitle
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
