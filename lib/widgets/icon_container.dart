import 'package:flutter/material.dart';

class IconContainer extends StatelessWidget {
  final IconData icon;
  final Color color;
  final Function() onPressed;
  const IconContainer({
    Key? key,
    required this.icon,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(35),
      child: InkWell(
        borderRadius: BorderRadius.circular(35),
        onTap: onPressed,
        child: Ink(
          height: 65,
          width: 65,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(35),
          ),
          child: Icon(
            icon,
            size: 30,
          ),
        ),
      ),
    );
  }
}
