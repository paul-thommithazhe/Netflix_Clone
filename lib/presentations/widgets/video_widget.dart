import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';

class VideoWidget extends StatelessWidget {
  VideoWidget(
      {Key? key,
      required this.height,
      required this.snapshot,
      required this.results,
      required this.imageUrl,
      required this.index})
      : super(key: key);
  final double height;
  AsyncSnapshot snapshot;
  String imageUrl;
  List results;
  int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image:  DecorationImage(
                image: NetworkImage(imageUrl + results[index]['poster_path']),
                fit: BoxFit.cover),
          ),
        ),
        Positioned(
          right: 10,
          bottom: 0,
          child: CircleAvatar(
            backgroundColor: Colors.black12,
            radius: 20,
            child: IconButton(
              onPressed: () {},
              icon:const Icon(
                Icons.volume_off_outlined,
                color: kWhiteColor,
                size: 22,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
