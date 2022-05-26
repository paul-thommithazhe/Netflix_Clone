import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/presentations/search/widgets/search_result.dart';

class VideoListItem extends StatelessWidget {
  VideoListItem(
      {Key? key, required this.index, required this.url, required this.result})
      : super(key: key);
  int index;
  final String url;
  final List result;
  @override
  Widget build(BuildContext context) {
    print(index);
    print('==================================================');
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                url + result[index]['poster_path'],
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //left side mute button
                CircleAvatar(
                  backgroundColor: Colors.black12,
                  radius: 30,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.volume_off_outlined,
                      color: kWhiteColor,
                      size: 30,
                    ),
                  ),
                ),
                //right side
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(imageUrls),
                      ),
                    ),
                    VideoActionsWidget(
                        icon: Icons.emoji_emotions, title: 'Lol'),
                    VideoActionsWidget(icon: Icons.add, title: 'My List'),
                    VideoActionsWidget(icon: Icons.send, title: 'Share'),
                    VideoActionsWidget(icon: Icons.play_arrow, title: 'Play')
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActionsWidget extends StatelessWidget {
  VideoActionsWidget({Key? key, required this.icon, required this.title})
      : super(key: key);
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: kWhiteColor,
            size: 30,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
