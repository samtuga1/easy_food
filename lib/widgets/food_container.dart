import 'package:easy_food/screens/food_screen.dart';
import 'package:flutter/material.dart';
import 'package:easy_food/constants.dart' as constants;
import 'package:easy_food/widgets/sub_containers.dart';

class FoodContainer extends StatelessWidget {
  final double? width;
  final Function()? onPressed;
  final int time;
  final String foodImage;
  final String foodLabel;
  const FoodContainer({
    Key? key,
    required this.foodLabel,
    required this.foodImage,
    required this.time,
    this.onPressed,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(40),
          onTap: onPressed,
          child: Container(
            height: 200,
            width: width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(foodImage), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 15.0,
                      left: 19,
                    ),
                    child: SubContainer(
                      icon: Icons.timer,
                      width: 90,
                      color: Colors.black38.withOpacity(0.6),
                      label: '$time mins',
                      iconColor: Colors.white,
                      style: constants.TextStyles.subTitle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 90,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Text(
            foodLabel,
            style: constants.TextStyles.title
                .copyWith(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
