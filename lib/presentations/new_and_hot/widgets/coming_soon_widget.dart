import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentations/home/widgets/custom_button_widget.dart';
import 'package:netflix_clone/presentations/widgets/api_fetch_method.dart';
import 'package:netflix_clone/presentations/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  ComingSoonWidget({
    Key? key,
    required this.index,
  }) : super(key: key);
  int index;
  String imageBaseUrl = 'https://www.themoviedb.org/t/p/w600_and_h900_bestv2';
  List results = [];
  // Map dates;
 
  @override
  Widget build(BuildContext context) {
    
    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: apiFetchMethod(
          'https://api.themoviedb.org/3/movie/upcoming?api_key=1e945ca454e5ba27f52e620c4047fb84&language=en-US&page=1'),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          print('errror');
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }
        if (snapshot.hasData) {
          Map map = snapshot.data;

          print(map['dates']['minimum']);
          // dates = map['dates'];
          results = map['results'];
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 50,
                height: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'FEB',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: kGreyColor,
                      ),
                    ),
                    Text(
                      '11',
                      style: TextStyle(
                        fontSize: 25,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              kWidth,
              SizedBox(
                width: size.width - 60,
                height: 450,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VideoWidget(
                          height: 170,
                          snapshot: snapshot,
                          results: results,
                          imageUrl: imageBaseUrl,
                          index: index),
                      kHeight,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              results[index]['title'],
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            children: const [
                              CustomButton(
                                title: 'Remind Me',
                                icon: Icons.alarm,
                                iconSize: 20,
                                textSize: 10,
                                textWeight: FontWeight.normal,
                              ),
                              kWidth,
                              CustomButton(
                                title: 'Info',
                                icon: Icons.info,
                                iconSize: 20,
                                textSize: 10,
                                textWeight: FontWeight.normal,
                              ),
                              kWidth
                            ],
                          ),
                        ],
                      ),
                      kHeight,
                       Text('Coming on ${results[index]['release_date']}'),
                      kHeight,
                      Text(
                        results[index]['title'],
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      kHeight,
                      Flexible(
                        child: Text(
                          results[index]['overview'],
                          style: TextStyle(
                            color: kGreyColor,
                          ),
                        ),
                      )
                    ]),
              ),
            ],
          );
        }

        return SizedBox();
      },
    );
  }
}
