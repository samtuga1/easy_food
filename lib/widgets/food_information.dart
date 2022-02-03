import 'package:flutter/material.dart';
import 'package:easy_food/constants.dart' as constants;

class FoodInfo extends StatelessWidget {
  final dynamic nutrientAmount;
  final String nutrientIcon;
  final String nutrientLabel;
  const FoodInfo({
    Key? key,
    required this.nutrientAmount,
    required this.nutrientIcon,
    required this.nutrientLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8.5),
            child: Image.asset(nutrientIcon),
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.28),
              borderRadius: BorderRadius.circular(9),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              '$nutrientAmount $nutrientLabel',
              style: constants.TextStyles.subTitle.copyWith(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
