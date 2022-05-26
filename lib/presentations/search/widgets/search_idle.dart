import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentations/search/widgets/title.dart';
import 'package:netflix_clone/presentations/widgets/api_fetch_method.dart';

final imageUrl =
    'https://www.themoviedb.org/t/p/w250_and_h141_face/pbrkL804c8yAv3zBZR4QPEafpAR.jpg';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTextTitle(
          title: 'Top Searches',
        ),
        kHeight,
        Expanded(
          child: FutureBuilder(
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
                return ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      print(index);
                      return TopSearchItemTile(
                          index: index, result: results, url: imageBaseUrl);
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        kHeight20,
                    itemCount: 10);
              }
              return kHeight;
            },
          ),
        ),
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  TopSearchItemTile(
      {Key? key, required index, required this.result, required this.url})
      : super(key: key);
  int index = 0;
  List result;
  String url;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Container(
          width: screenWidth * 0.37,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            image: DecorationImage(
                image: NetworkImage(url + result[index]['poster_path']),
                fit: BoxFit.cover),
          ),
        ),
        kWidth,
        Expanded(
          child: Text(
            result[index]['title'],
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const CircleAvatar(
          backgroundColor: kWhiteColor,
          radius: 25,
          child: CircleAvatar(
            backgroundColor: kBlackColor,
            radius: 23,
            child: Icon(
              CupertinoIcons.play_fill,
              color: kWhiteColor,
            ),
          ),
        ),
      ],
    );
  }
}
