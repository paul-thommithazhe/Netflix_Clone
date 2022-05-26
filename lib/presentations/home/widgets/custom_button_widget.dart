import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.title,
      required this.icon,
      this.iconSize = 25,
      this.textSize = 15,
      this.textWeight = FontWeight.bold})
      : super(key: key);
  final String title;
  final IconData icon;
  final double iconSize;
  final double textSize;
  final FontWeight textWeight;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Icon(
        icon,
        color: kWhiteColor,
        size: iconSize,
      ),
      Text(
        title,
        style: TextStyle(
            fontSize: textSize,
            color: kWhiteColor,
            fontWeight: textWeight),
      )
    ]);
  }
}
