import 'package:easy_food/screens/search_screen.dart';
import 'package:easy_food/widgets/food_container.dart';
import 'package:easy_food/widgets/sub_containers.dart';
import 'package:flutter/material.dart';
import 'package:easy_food/widgets/icon_container.dart';
import 'package:easy_food/constants.dart' as constants;
import 'package:flutter/widgets.dart';
import 'package:easy_food/widgets/food_information.dart';

import 'bookmark_screen.dart';

class FoodScreen extends StatefulWidget {
  static String id = 'food_screen.dart';
  final dynamic carbs;
  final dynamic calories;
  final dynamic fat;
  final dynamic protein;
  final String? foodName;
  final String? image;
  final int? foodTime;
  final String? foodInstructions;
  const FoodScreen(
      {Key? key,
      this.image,
      this.foodName,
      this.foodTime,
      this.carbs,
      this.calories,
      this.fat,
      this.protein,
      this.foodInstructions})
      : super(key: key);

  @override
  _FoodScreenState createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  bool bookmarkPressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.image.toString()),
                  fit: BoxFit.cover,
                ),
              ),
              child: Align(
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, top: 2),
                      child: IconContainer(
                        color: Colors.yellow,
                        icon: Icons.arrow_back_ios_outlined,
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0, top: 2),
                      child: IconContainer(
                        color: bookmarkPressed == false
                            ? const Color(0xFFf5f5f5)
                            : Colors.yellow,
                        icon: Icons.bookmark_border,
                        onPressed: () {
                          setState(() {
                            bookmarkPressed = !bookmarkPressed;
                          });
                          constants.bookMarkList.add(
                            FoodContainer(
                              foodLabel: widget.foodName.toString(),
                              foodImage: widget.image.toString(),
                              time: widget.foodTime!,
                            ),
                          );
                        },
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
                              widget.foodName.toString(),
                              textAlign: TextAlign.start,
                              style: constants.TextStyles.title
                                  .copyWith(fontSize: 25),
                            ),
                          ),
                          SubContainer(
                            icon: Icons.timer,
                            width: 90,
                            color: Colors.yellow,
                            label: '${widget.foodTime} mins',
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
                              children: [
                                FoodInfo(
                                  nutrientLabel: 'Carbs',
                                  nutrientIcon: 'assets/icons/carbohydrate.png',
                                  nutrientAmount: widget.carbs,
                                ),
                                FoodInfo(
                                  nutrientLabel: 'Proteins',
                                  nutrientIcon: 'assets/icons/protein.png',
                                  nutrientAmount: widget.protein,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Row(
                              children: [
                                FoodInfo(
                                  nutrientLabel: 'Fats',
                                  nutrientIcon: 'assets/icons/pizza.png',
                                  nutrientAmount: widget.fat,
                                ),
                                FoodInfo(
                                  nutrientLabel: 'Cal',
                                  nutrientIcon: 'assets/icons/calories.png',
                                  nutrientAmount: widget.calories,
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
                        'Instructions',
                        style:
                            constants.TextStyles.title.copyWith(fontSize: 25),
                      ),
                      Text(
                        widget.foodInstructions.toString(),
                        style: constants.TextStyles.subTitle.copyWith(
                            fontSize: 20, fontWeight: FontWeight.bold),
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
