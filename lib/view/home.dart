import 'package:flutter/material.dart';
import 'package:newstech/model/news.dart';
import 'package:newstech/presenter/presenter.dart';
import 'package:newstech/view/reading.dart';

class HomePage extends StatefulWidget {
  static const homeRoute = '/Home';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Presenter? presenter;

  @override
  void initState() {
    presenter = Presenter();
    super.initState();
  }

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
        children: [
          FutureBuilder(
            future: presenter?.getNewsApi(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Expanded(
                    child: Center(child: CircularProgressIndicator()));
              } else if (snapshot.hasData) {
                return newsTech(snapshot.data!);
              } else {
                return Expanded(child: Center(child: Text('Erro')));
              }
            },
          )
        ],
      ),
    );
  }

  Widget newsTech(List<NewsModel> dataNews) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: dataNews.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, ReadingNews.readingRoute,
                      arguments: dataNews[index]);
                },
                child: Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  height: 360,
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
                        child: Image.network(
                          "${dataNews[index].image_url}",
                          width: 330,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              "${dataNews[index].description}",
                              textAlign: TextAlign.left,
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 18, fontFamily: 'TitleNewsRoslab'),
                            ),
                          ),
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
