import 'package:flutter/material.dart';
import 'package:newstech/view/landscape/reading_landscp.dart';
import 'package:newstech/view/home.dart';
import 'package:newstech/view/reading.dart';
import 'package:newstech/view/splashscreen.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Color(0xffFEFDFF)),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        HomePage.homeRoute: (context) => HomePage(),
        ReadingNews.readingRoute: (context) => ReadingNews(
              listNews: [],
            ),
        ReadingNewsLandScape.readingRouteLandScape: (context) =>
            ReadingNewsLandScape(listNews: [])
      },
    );
  }
}
