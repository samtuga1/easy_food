import 'package:easy_food/screens/food_screen.dart';
import 'package:flutter/material.dart';
import 'package:easy_food/constants.dart' as constants;
import 'package:easy_food/widgets/sub_containers.dart';

class FoodContainer extends StatelessWidget {
  final String foodLabel;
  const FoodContainer({
    Key? key,
    required this.foodLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(40),
          onTap: () => Navigator.pushNamed(context, FoodScreen.id),
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.red,
              image: const DecorationImage(
                image: AssetImage('assets/icons/pizza.png'),
              ),
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
                      color: Colors.black38.withOpacity(0.4),
                      label: '15 mins',
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
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SubContainer(
                      icon: Icons.star,
                      width: 65,
                      color: Colors.yellow,
                      label: '4.8',
                      style: constants.TextStyles.title
                          .copyWith(color: Colors.black, fontSize: 18),
                      iconColor: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Text(
          foodLabel,
          style: constants.TextStyles.title
              .copyWith(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
