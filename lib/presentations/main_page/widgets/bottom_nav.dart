
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';

ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (BuildContext context, int newIndex, _) => BottomNavigationBar(
              currentIndex: newIndex,
              onTap: (index) {
                indexChangeNotifier.value = index;
              },
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey.shade700,
              iconSize: 23,
              selectedFontSize: 10,
              unselectedFontSize: 10,
              type: BottomNavigationBarType.fixed,
              backgroundColor: backgroundColor,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.video_library),
                  label: 'New & Hot',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.emoji_emotions),
                  label: 'Fast Laughs',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.download_for_offline),
                  label: 'Download',
                ),
              ],
            ));
  }
}
