import 'package:flutter/material.dart';
import 'package:easy_food/constants.dart' as constants;

class Preference extends StatefulWidget {
  final IconData icon;
  final String title;
  const Preference({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  State<Preference> createState() => _PreferenceState();
}

class _PreferenceState extends State<Preference> {
  bool preferencePressed = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Ink(
              child: InkWell(
                borderRadius: BorderRadius.circular(40),
                onTap: () => setState(() {
                  preferencePressed = !preferencePressed;
                }),
                child: Icon(
                  widget.icon,
                  size: 45,
                ),
              ),
              //
              width: 80,
              height: 100,
              decoration: BoxDecoration(
                color: preferencePressed == false
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
