import 'package:flutter/material.dart';
import 'package:netflix_clone/presentations/downloads/screen_download_page.dart';
import 'package:netflix_clone/presentations/fast_laugh/screen_fast_laugh.dart';
import 'package:netflix_clone/presentations/home/screen_home.dart';
import 'package:netflix_clone/presentations/main_page/widgets/bottom_nav.dart';
import 'package:netflix_clone/presentations/new_and_hot/screen_new_and_hot.dart';
import 'package:netflix_clone/presentations/search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({Key? key}) : super(key: key);
  final _pages = [
    ScreenHome(),
    ScreenNewAndHot(),
    ScreenFastLaugh(),
    ScreenSearch(),
    ScreenDownload(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (BuildContext context, int newIndex, _) => _pages[newIndex],
        ),
      ),
      bottomNavigationBar: BottomNavigationWidget(),
    );
  }
}
