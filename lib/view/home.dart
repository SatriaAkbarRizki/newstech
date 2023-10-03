import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:newstech/data/dataold.dart';
import 'package:newstech/model/news.dart';
import 'package:newstech/presenter/presenter.dart';
import 'package:newstech/view/reading.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends StatelessWidget {
  static const homeRoute = '/Home';

  // Pakai data statis kalau dari api kenak limit maupun eror
  DataOldApi dataOldApi = DataOldApi();

  HomePage({super.key});
  Widget build(BuildContext context) {
    print('Data old: ${dataOldApi.valueOld()}');
    Size sizeDevice = MediaQuery.of(context).size;
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
      body: Stack(
        children: [
          Column(
            children: [
              FutureBuilder(
                future: Presenter().getNewsApi(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // Show a loading indicator.
                    return LoadingData(
                      sizeDevice: sizeDevice,
                    );
                  } else if (snapshot.hasData) {
                    // Show the news list.
                    return newsTech(sizeDevice, snapshot.data!);
                  } else {
                    print('Error Message: ${snapshot.error}');
                    return newsTech(sizeDevice, dataOldApi.valueOld());
                  }
                },
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget newsTech(Size sizeDevice, List<NewsModel> dataNews) {
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
                  height: sizeDevice.height / 2,
                  width: sizeDevice.width,
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
                          width: sizeDevice.width,
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
                              overflow: TextOverflow.fade,
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

  Widget HaveEror(BuildContext context) {
    return Expanded(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Animate(
            effects: [FadeEffect(duration: 800.ms, delay: 250.ms)],
            child: Center(
              child: Image.asset(
                "assets/images/eror.png",
                scale: 1.2,
              ),
            ),
          ),
          Animate(
            effects: [
              FadeEffect(duration: 1000.ms, delay: 300.ms),
            ],
            child: SizedBox(
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
          ),
          Animate(
            effects: [FadeEffect(duration: 1000.ms, delay: 300.ms)],
            child: SizedBox(
              height: 50,
              child: Animate(
                effects: [ShimmerEffect(duration: 1000.ms, delay: 800.ms)],
                child: ElevatedButton(
                    onPressed: () async {
                      Presenter().getNewsApi().whenComplete(() {
                        Navigator.pushReplacementNamed(
                            context, HomePage.homeRoute);
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
              ),
            ),
          )
        ],
      ),
    ));
  }
}

class LoadingData extends StatelessWidget {
  final Size sizeDevice;

  const LoadingData({required this.sizeDevice, super.key});

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
                width: sizeDevice.width,
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
                            width: sizeDevice.width,
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
