import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentations/home/widgets/background_card.dart';
import 'package:netflix_clone/presentations/home/widgets/number_title_card.dart';
import 'package:netflix_clone/presentations/widgets/main_title_widget.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (context, value, child) =>
            NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;
            print(direction);
            if (direction == ScrollDirection.reverse) {
              scrollNotifier.value = false;
            } else if (direction == ScrollDirection.forward) {
              scrollNotifier.value = true;
            }
            return true;
          },
          child: Stack(
            children: [
              ListView(
                children: [
                  BackgroundCard(),
                  kHeight,
                  MainTitleCardWidget(title: 'New Releases', url: popularUrls),
                  kHeight,
                  MainTitleCardWidget(
                      title: 'English Movies', url: trendingUrls),
                  kHeight,
                  MainTitleCardWidget(title: 'Trending Now', url: trendingUrls),
                  kHeight,
                  NumberTitleCard(title: 'Top 10 In India Today', url: top10),
                  kHeight,
                  MainTitleCardWidget(title: 'US Movies', url: popularUrls),
                  kHeight,
                  MainTitleCardWidget(
                      title: 'Hindi Movies & TV', url: popularUrls),
                  kHeight,
                ],
              ),
              scrollNotifier.value
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                            width: double.infinity,
                            height: 70,
                            color: Colors.transparent,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: Image.asset(
                                    'assets/logo/netflix_logo.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const Spacer(),
                                Icon(
                                  Icons.cast,
                                  color: kWhiteColor,
                                  size: 25,
                                ),
                                kWidth,
                                Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 25,
                                        height: 25,
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          image: const DecorationImage(
                                            image: NetworkImage(
                                                'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/noInYh5IKASiecR5lHJSjXIDmkm.jpg'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'TV Shows',
                                style: TextStyle(
                                    color: kWhiteColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Movies',
                                style: TextStyle(
                                    color: kWhiteColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Categories',
                                style: TextStyle(
                                    color: kWhiteColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  : kHeight,
            ],
          ),
        ),
      ),
    );
  }
}
