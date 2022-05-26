import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentations/home/widgets/custom_button_widget.dart';
import 'package:netflix_clone/presentations/widgets/api_fetch_method.dart';
import 'package:netflix_clone/presentations/widgets/video_widget.dart';
import 'package:shimmer/shimmer.dart';

class EveryoneWatchingWidget extends StatelessWidget {
  EveryoneWatchingWidget({
    Key? key,
    required this.index,
  }) : super(key: key);
  List results = [];
  int index;
  String imageBaseUrl = 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2';
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiFetchMethod(
          'https://api.themoviedb.org/3/movie/top_rated?api_key=1e945ca454e5ba27f52e620c4047fb84&language=en-US&page=1'),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          print('errror');
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Shimmer.fromColors(
            baseColor: kWhiteColor,
            highlightColor: kGreyColor,
            child: Padding(
              padding: const EdgeInsets.only(top:5.0),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 40,
                ),
                title: Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: kWhiteColor
                  ),
                ),
              ),
            ),
          );
        }

        if (snapshot.hasData) {
          Map map = snapshot.data;

          results = map['results'];

          String imageBaseUrl =
              'https://www.themoviedb.org/t/p/w600_and_h900_bestv2';

          return Container(
            height: 390,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  results[index]['title'],
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                kHeight,
                 Expanded(
                   child: Text(
                    results[index]['overview'],
                    style: TextStyle(color: kGreyColor),
                    
                                 ),
                 ),
                kHeight50,
                VideoWidget(
                  index: index,
                  height: 170,
                  snapshot: snapshot,
                  results: results,
                  imageUrl: imageBaseUrl,
                ),
                kHeight20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    CustomButton(
                      title: 'Share',
                      icon: Icons.share,
                      iconSize: 25,
                      textSize: 15,
                      textWeight: FontWeight.normal,
                    ),
                    kWidth,
                    CustomButton(
                      title: 'My List',
                      icon: Icons.add,
                      iconSize: 25,
                      textSize: 15,
                      textWeight: FontWeight.normal,
                    ),
                    kWidth,
                    CustomButton(
                      title: 'Play',
                      icon: Icons.play_arrow,
                      iconSize: 25,
                      textSize: 15,
                      textWeight: FontWeight.normal,
                    ),
                    kWidth,
                  ],
                )
              ],
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}
