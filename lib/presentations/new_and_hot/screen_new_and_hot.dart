import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentations/new_and_hot/widgets/coming_soon_widget.dart';
import 'package:netflix_clone/presentations/new_and_hot/widgets/everyone_watching_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: AppBar(
            title: const Text(
              'New & Hot',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            actions: [
              Icon(
                Icons.cast,
                color: kWhiteColor,
                size: 25,
              ),
              kWidth,
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Column(
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/noInYh5IKASiecR5lHJSjXIDmkm.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              kWidth,
            ],
            bottom: TabBar(
                isScrollable: true,
                indicator: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: kRadius30,
                ),
                labelStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                labelColor: kBlackColor,
                unselectedLabelColor: kWhiteColor,
                tabs: const [
                  Tab(text: "🍿 Comming soon"),
                  Tab(text: "🔥  Everyone's watching"),
                ]),
          ),
        ),
        body: TabBarView(children: [
          _buildComingSoon(context),
          _buildEveryonesWatching(context),
        ]),
      ),
    );
  }

  Widget _buildComingSoon(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) =>
            ComingSoonWidget(index: index),
      ),
    );
  }

  Widget _buildEveryonesWatching(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return EveryoneWatchingWidget(index: index);
        },
      ),
    );
  }
}
