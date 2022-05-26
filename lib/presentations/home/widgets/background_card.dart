import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentations/home/widgets/custom_button_widget.dart';
import 'package:netflix_clone/presentations/widgets/api_fetch_method.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FutureBuilder(
          future: apiFetchMethod(trendingUrls),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              print('errror');
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            if (snapshot.hasData) {
              Map map = snapshot.data;

              List results = map['results'];

              String imageBaseUrl =
                  'https://www.themoviedb.org/t/p/w600_and_h900_bestv2';

              return Container(
                width: double.infinity,
                height: 500,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    image:
                        NetworkImage(imageBaseUrl + results[5]['poster_path']),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }
            return kHeight;
          },
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(title: 'My List', icon: Icons.add),
                _playButton(),
                CustomButton(title: 'Info', icon: Icons.info_outline)
              ],
            ),
          ),
        )
      ],
    );
  }

  TextButton _playButton() {
    return TextButton.icon(
      style:
          ButtonStyle(backgroundColor: MaterialStateProperty.all(kWhiteColor)),
      onPressed: () {},
      icon: const Icon(
        Icons.play_arrow,
        size: 25,
        color: kBlackColor,
      ),
      label: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 9.0),
        child: Text(
          'Play',
          style: TextStyle(
              fontSize: 18, color: kBlackColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
