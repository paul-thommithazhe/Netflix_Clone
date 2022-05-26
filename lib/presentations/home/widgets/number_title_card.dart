import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentations/home/widgets/number_card.dart';
import 'package:netflix_clone/presentations/widgets/api_fetch_method.dart';
import 'package:netflix_clone/presentations/widgets/main_title.dart';

class NumberTitleCard extends StatelessWidget {
  NumberTitleCard({
    Key? key,
    required this.url,
    required this.title,
  }) : super(key: key);

  String url;
  String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: title),
        kHeight,
        LimitedBox(
          maxHeight: 200,
          child: FutureBuilder(
            future: apiFetchMethod(url),
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

                return ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    10,
                    (index) {
                      return NumberCard(
                        result: results,
                        imageUrl: imageBaseUrl,
                        snap: snapshot,
                        url: url,
                        index: index,
                      );
                    },
                  ),
                );
              }
              return kHeight;
            },
          ),
        )
      ],
    );
  }
}
