import 'package:flutter/material.dart';
import 'package:newstech/model/news.dart';
import 'package:newstech/view/landscape/reading_landscp.dart';
import 'package:shimmer/shimmer.dart';

class NewsTechLandscape extends StatelessWidget {
  final Size sizeDevice;
  final List<NewsModel> dataNews;

  const NewsTechLandscape({required this.sizeDevice, required this.dataNews});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1.3,
          crossAxisCount: 2,
        ),
        itemCount: dataNews.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                      context, ReadingNewsLandScape.readingRouteLandScape,
                      arguments: dataNews[index]);
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    height: 280,
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
                            child: Container(
                              height: 150,
                              width: sizeDevice.width,
                              decoration: BoxDecoration(color: Colors.grey),
                              child: Image.network(
                                "${dataNews[index].image_url}",
                                width: sizeDevice.width,
                                fit: BoxFit.cover,
                              ),
                            )),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Container(
                                height: 10,
                                child: Text(
                                  "${dataNews[index].description}",
                                  textAlign: TextAlign.left,
                                  maxLines: 5,
                                  overflow: TextOverflow.fade,
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'TitleNewsRoslab'),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class LoadingDataLandscape extends StatelessWidget {
  final Size sizeDevice;

  const LoadingDataLandscape({required this.sizeDevice, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1.3,
          crossAxisCount: 2,
        ),
        itemCount: 4,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  height: 250,
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
                              height: 150,
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
              ),
            ],
          );
        },
      ),
    );
  }
}
