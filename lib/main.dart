import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors.dart';
import 'package:netflix_clone/presentations/main_page/screen_main_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Netflix Clone",
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
        primaryColor: Colors.blue,
        backgroundColor: backgroundColor,
        scaffoldBackgroundColor: backgroundColor,
        // fontFamily: GoogleFonts.montserrat().fontFamily,
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
      home: ScreenMainPage(),
    );
  }
}
