import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentations/fast_laugh/widgets/video_list_item.dart';
import 'package:netflix_clone/presentations/widgets/api_fetch_method.dart';
import 'package:netflix_clone/presentations/widgets/app_bar_widget.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBarWidget(
            appbarTitle: 'Fast and Laugh',
          )),
      body: PageView(
        scrollDirection: Axis.vertical,
        children: List.generate(10, (index) {
          return FutureBuilder(
              future: apiFetchMethod(trendingUrls),
              builder: (context, AsyncSnapshot snapshot) {
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
                  return VideoListItem(
                    index: index,
                    result: results,
                    url: imageBaseUrl,
                  );
                }
                return kHeight;
              });
        }),
      ),
    );
  }
}
