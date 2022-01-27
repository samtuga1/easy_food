import 'package:easy_food/widgets/sub_containers.dart';
import 'package:flutter/material.dart';
import 'package:easy_food/widgets/icon_container.dart';
import 'package:easy_food/constants.dart' as constants;
import 'package:flutter/widgets.dart';
import 'package:easy_food/widgets/food_information.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({Key? key}) : super(key: key);

  @override
  _FoodScreenState createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: Colors.blue,
              child: Align(
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 15.0, top: 2),
                      child: IconContainer(
                        color: Colors.yellow,
                        icon: Icons.arrow_back_ios_outlined,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15.0, top: 2),
                      child: IconContainer(
                        color: Color(0xFFf5f5f5),
                        icon: Icons.bookmark_border,
                      ),
                    ),
                  ],
                ),
              ),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.3,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 25.0,
                    left: 25,
                  ),
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              'Fufu with palm nut soup',
                              textAlign: TextAlign.start,
                              style: constants.TextStyles.title
                                  .copyWith(fontSize: 25),
                            ),
                          ),
                          SubContainer(
                            icon: Icons.timer,
                            width: 90,
                            color: Colors.yellow,
                            label: '15 mins',
                            iconColor: Colors.black,
                            style: constants.TextStyles.title.copyWith(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 13.0),
                        child: Column(
                          children: [
                            Row(
                              children: const [
                                FoodInfo(
                                  nutrientLabel: 'Carbs',
                                  nutrientIcon: 'assets/icons/carbohydrate.png',
                                  nutrientAmount: 10,
                                ),
                                FoodInfo(
                                  nutrientLabel: 'Proteins',
                                  nutrientIcon: 'assets/icons/protein.png',
                                  nutrientAmount: 20,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Row(
                              children: const [
                                FoodInfo(
                                  nutrientLabel: 'Fats',
                                  nutrientIcon: 'assets/icons/pizza.png',
                                  nutrientAmount: 10,
                                ),
                                FoodInfo(
                                  nutrientLabel: 'Cal',
                                  nutrientIcon: 'assets/icons/calories.png',
                                  nutrientAmount: 20,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Ingredients',
                        style:
                            constants.TextStyles.title.copyWith(fontSize: 25),
                      ),
                      Column(
                        children: constants.ingredientList,
                      ),
                    ],
                  ),
                ),
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                  color: Colors.white,
                ),
                width: double.infinity,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
