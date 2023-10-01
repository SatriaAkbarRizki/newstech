import 'package:flutter/material.dart';
import 'package:newstech/view/home.dart';
import 'package:newstech/view/reading.dart';

void main() {
  runApp( MainApp());
}

class MainApp extends StatelessWidget {
   MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Color(0xffFEFDFF)),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        HomePage.homeRoute: (context) => HomePage(),
        ReadingNews.readingRoute: (context) => ReadingNews(
              listNews: [],
            )
      },
    );
  }
}