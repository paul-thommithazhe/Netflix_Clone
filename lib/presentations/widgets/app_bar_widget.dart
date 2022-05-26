import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';

class AppBarWidget extends StatelessWidget {
  AppBarWidget({Key? key, required this.appbarTitle}) : super(key: key);
  final String appbarTitle;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      kWidth,
      Expanded(
        child: Text(
          appbarTitle,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.cast,
            color: Colors.white,
          )),
      SizedBox(
        width: 25,
        height: 25,
        child: Container(
          width: 25,
          height: 25,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(
                image: NetworkImage(
                    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/noInYh5IKASiecR5lHJSjXIDmkm.jpg'),
                fit: BoxFit.cover),
          ),
        ),
      ),
      kWidth
    ]);
  }
}
