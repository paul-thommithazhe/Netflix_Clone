import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';

class MainCardWidget extends StatelessWidget {
  MainCardWidget({
    Key? key,
    required this.imageUrl,
    required this.index,
    required this.result,
  }) : super(key: key);
  String imageUrl;
  int index;
  List result;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 130,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: kRadius10,
          image: DecorationImage(
              image: NetworkImage(imageUrl + result[index]['poster_path']),
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
