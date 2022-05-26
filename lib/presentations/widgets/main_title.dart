import 'package:flutter/material.dart';

class MainTitle extends StatelessWidget {
  MainTitle({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:5.0),
      child: Text(
        title,
        style:const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}
