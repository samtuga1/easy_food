import 'package:flutter/material.dart';

class SubContainer extends StatelessWidget {
  final double width;
  final Color color;
  final IconData icon;
  final String label;
  final Color iconColor;
  final TextStyle style;
  const SubContainer({
    Key? key,
    required this.width,
    required this.color,
    required this.icon,
    required this.label,
    required this.iconColor,
    required this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 2, bottom: 2),
            child: Icon(
              icon,
              color: iconColor,
            ),
          ),
          const SizedBox(
            width: 3,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 2.0),
            child: Text(label, style: style),
          ),
        ],
      ),
      height: 30,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(40),
      ),
    );
  }
}
