import 'package:flutter/material.dart';
import 'package:newstech/view/reading.dart';

class HomePage extends StatefulWidget {
  static const homeRoute = '/Home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'News',
              style: TextStyle(
                  color: Colors.black, fontFamily: 'TitleCroiss', fontSize: 22),
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              height: 30,
              width: 80,
              decoration: BoxDecoration(color: Colors.black),
              child: Center(
                child: Text(
                  'TECH',
                  style: TextStyle(
                      fontFamily: 'ArchiveBlack', color: Colors.white),
                ),
              ),
            )
          ],
        ),
        forceMaterialTransparency: true,
      ),
      backgroundColor: Color(0xffEDEDE9),
      body: Column(
        children: [newsTech()],
      ),
    );
  }

  Widget newsTech() {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, ReadingNews.readingRoute);
                },
                child: Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  height: 350,
                  width: 350,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(18)),
                      border: Border.all(style: BorderStyle.solid)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          "assets/images/exampleimage.jpg",
                          width: 330,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam accumsan eget augue non sollicitudin. Morbi tempus, nisi eget tincidunt efficitur,  imperdiet ",
                          textAlign: TextAlign.left,
                          maxLines: 3,
                          style: TextStyle(
                              fontSize: 18, fontFamily: 'TitleNewsRoslab'),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              )
            ],
          );
        },
      ),
    );
  }
}
