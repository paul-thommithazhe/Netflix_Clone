import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentations/search/widgets/title.dart';

final imageUrls =
    'https://www.themoviedb.org/t/p/w250_and_h141_face/en971MEXui9diirXlogOrPKmsEn.jpg';

@override
class SearchResultWidget extends StatelessWidget {
  SearchResultWidget({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTextTitle(title: 'Moveis & TV'),
        kHeight,
        Expanded(
          child: GridView.count(
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1 / 1.4,
            shrinkWrap: true,
            crossAxisCount: 3,
            children: List.generate(20, (index) {
              return MainCard();
            }),
          ),
        )
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        image: DecorationImage(
          image: NetworkImage(imageUrls),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
