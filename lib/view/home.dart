import 'package:flutter/material.dart';
import 'package:newstech/model/news.dart';
import 'package:newstech/presenter/presenter.dart';
import 'package:newstech/view/reading.dart';
import 'package:shimmer/shimmer.dart';

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
      body: RefreshIndicator(
        onRefresh: () async {
          Future.delayed(Duration(seconds: 1), () {
            setState(() {});
          });
        },
        color: Colors.white,
        backgroundColor: Colors.black,
        child: Stack(
          children: [
            Column(
              children: [
                FutureBuilder(
                  future: presenter?.getNewsApi(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      // Show a loading indicator.
                      return LoadingData();
                    } else if (snapshot.hasData) {
                      // Show the news list.
                      return newsTech(snapshot.data!);
                    } else {
                      // Show an empty state if an error occurred.
                      return HaveEror();
                    }
                  },
                )
              ],
            ),
          ],
        ),
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

  Widget HaveEror() {
    return Expanded(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/images/eror.png",
              scale: 1.2,
            ),
          ),
          SizedBox(
            width: 250,
            child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'hmm.. looks like there is a problem, try refreshing  ',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Roboto'),
                )),
          ),
          SizedBox(
            height: 50,
            child: ElevatedButton(
                onPressed: () async {
                  Future.delayed(Duration(seconds: 1)).whenComplete(() {
                    setState(() {});
                  });
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.blue,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: Text(
                  'Refresh Page',
                  style: TextStyle(color: Colors.white),
                )),
          )
        ],
      ),
    ));
  }
}

class LoadingData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                height: 360,
                width: 350,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(18)),
                    border: Border.all(style: BorderStyle.solid)),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade500,
                  highlightColor: Colors.grey.shade400,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            height: 280,
                            width: 350,
                            decoration: BoxDecoration(color: Colors.grey),
                          )),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Container(
                              height: 10,
                              decoration: BoxDecoration(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: SizedBox(
                            width: 250,
                            child: Container(
                              height: 10,
                              decoration: BoxDecoration(color: Colors.grey),
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
