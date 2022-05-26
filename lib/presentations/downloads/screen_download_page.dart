import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentations/widgets/api_fetch_method.dart';
import 'package:netflix_clone/presentations/widgets/app_bar_widget.dart';
import 'package:http/http.dart' as http;

class ScreenDownload extends StatelessWidget {
  ScreenDownload({Key? key}) : super(key: key);
  final _widgets = [
    const _SmartDownloads(),
    Section2(),
    Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          appbarTitle: 'Downloads',
        ),
      ),
      body: ListView.separated(
          padding: EdgeInsets.all(10),
          itemBuilder: (BuildContext context, int index) => _widgets[index],
          separatorBuilder: (context, index) => SizedBox(height: 30),
          itemCount: _widgets.length),
    );
  }
}

class Section2 extends StatelessWidget {
  Section2({Key? key}) : super(key: key);

  // final downloadsList = [
  //   'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg',
  //   'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/y8NJnTXzb4rio9uvVYFVrXEMofU.jpg',
  //   'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/2MSGZEE6XZd2r4ODNziwAw7Hpw0.jpg'
  // ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        const Text(
          'Introducing Downloads For You',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kWhiteColor, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        kHeight,
        const Text(
          'We\'ll download a personalized selection of\n movies and shows for you, so there\'s\n always something to watch on your\n device',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kGreyColor, fontSize: 15, fontWeight: FontWeight.w300),
        ),
        FutureBuilder(
          future: apiFetchMethod(
              'https://api.themoviedb.org/3/trending/all/day?api_key=1e945ca454e5ba27f52e620c4047fb84'),
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

              return SizedBox(
                width: size.width,
                height: size.width,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey.withOpacity(0.6),
                      radius: size.width * 0.39,
                    ),
                    DownloadsImageWidget(
                      imageList: imageBaseUrl + results[0]['poster_path'],
                      angle: 20,
                      size: Size(size.width * 0.4, size.width * 0.49),
                      margin: EdgeInsets.only(left: 140, bottom: 40),
                    ),
                    DownloadsImageWidget(
                        angle: -20,
                        size: Size(size.width * 0.4, size.width * 0.49),
                        imageList: imageBaseUrl + results[1]['poster_path'],
                        margin: EdgeInsets.only(right: 140, bottom: 40)),
                    DownloadsImageWidget(
                        imageList: imageBaseUrl + results[2]['poster_path'],
                        size: Size(size.width * 0.4, size.width * 0.58),
                        margin: EdgeInsets.only(left: 0)),
                  ],
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.only(top: 200.0),
              child: CircularProgressIndicator(),
            );
          },
        )
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: const Text(
              'Set up',
              style: TextStyle(
                  color: kWhiteColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            color: kButtonColorBlue,
          ),
        ),
        MaterialButton(
          onPressed: () {},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: const Text(
            'See what you can download ',
            style: TextStyle(
              color: kBlackColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          color: kButtonColorWhite,
        )
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          Icons.settings,
          color: kWhiteColor,
        ),
        Text('Smart Downloads'),
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    Key? key,
    required this.imageList,
    required this.margin,
    required this.size,
    this.angle = 0,
  }) : super(key: key);
  final double angle;
  final String imageList;
  final EdgeInsets margin;
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 23.0),
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: Container(
          margin: margin,
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(imageList), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
    );
  }
}
