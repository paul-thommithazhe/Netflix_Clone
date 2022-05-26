import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/constants.dart';

class NumberCard extends StatelessWidget {
  NumberCard({
    Key? key,
    required this.index,
    required this.url,
    required this.snap,
    required this.result,
    required this.imageUrl,
  }) : super(key: key);
  final int index;
  String imageUrl;
  String url;
  List result;
  AsyncSnapshot snap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Row(
            children: [
              const SizedBox(width: 50, height: 150),
              Container(
                width: 130,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: kRadius10,
                  image: DecorationImage(
                      image:
                          NetworkImage(imageUrl + result[index]['poster_path']),
                      fit: BoxFit.cover),
                ),
              ),
            ],
          ),
          Positioned(
            left: 10,
            bottom: -26,
            child: BorderedText(
              strokeWidth: 10.0,
              strokeColor: kWhiteColor,
              child: Text(
                '${index + 1}',
                style: const TextStyle(
                  fontSize: 140,
                  color: kBlackColor,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                  decorationColor: kBlackColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
