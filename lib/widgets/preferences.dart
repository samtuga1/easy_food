import 'package:flutter/material.dart';
import 'package:easy_food/constants.dart' as constants;

class Preference extends StatefulWidget {
  final String imageName;
  final String title;
  final Function() onPressed;
  final bool preferenceColor;
  const Preference({
    Key? key,
    required this.imageName,
    required this.title,
    required this.onPressed,
    required this.preferenceColor,
  }) : super(key: key);

  @override
  State<Preference> createState() => _PreferenceState();
}

class _PreferenceState extends State<Preference> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Ink(
              child: InkWell(
                borderRadius: BorderRadius.circular(40),
                onTap: widget.onPressed,
                child: Image.asset(
                  widget.imageName,
                  scale: 1.5,
                ),
              ),
              //
              width: 80,
              height: 100,
              decoration: BoxDecoration(
                color: widget.preferenceColor == false
                    ? const Color(0xFFf5f5f5)
                    : Colors.yellow, //,
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.title,
              style: constants.TextStyles.subTitle
                  .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(
          width: 25,
        )
      ],
    );
  }
}
