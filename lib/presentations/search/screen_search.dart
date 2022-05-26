import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentations/search/widgets/search_idle.dart';
import 'package:netflix_clone/presentations/widgets/app_bar_widget.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          appbarTitle: 'Search',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CupertinoSearchTextField(
            backgroundColor: kGreyColor.withOpacity(0.35),
            prefixIcon: const Icon(
              Icons.search,
              color: kGreyColor,
            ),
            suffixIcon: const Icon(
              CupertinoIcons.xmark_circle_fill,
              color: kGreyColor,
            ),
            style: TextStyle(color: kWhiteColor),
          ),
          kHeight,
          // Expanded(child: SearchResultWidget)
          Expanded(
            child: SearchIdleWidget(),
          ),
        ]),
      ),
    );
  }
}
