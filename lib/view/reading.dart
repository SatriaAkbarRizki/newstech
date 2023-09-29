import 'package:flutter/material.dart';
import 'package:newstech/model/news.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class ReadingNews extends StatelessWidget {
  static const readingRoute = '/ReadingRoute';
  final List<NewsModel> listNews;
  const ReadingNews({required this.listNews, super.key});
  final title =
      "Spotify Luncurkan Fitur Terjemahan Bertenaga AI, Gunakan Suara Podcaster Top";
  final description =
      "Spotify telah meluncurkan sistem AI yang menerjemahkan podcast populer ke berbagai bahasa dengan tetap mempertahankan suara pembawa acara atau podcaster top. Fitur terjemahan dapat mentranskripsikan bahasa....";
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as NewsModel;

    final sizeDevice = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              Stack(
                children: [
                  Container(
                    width: sizeDevice.width,
                    height: 350,
                    child: Image.network(
                      '${args.image_url}',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: 350,
                    padding: const EdgeInsets.all(5.0),
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                          Colors.black.withAlpha(0),
                          Colors.black12,
                          Colors.black
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      left: 10,
                      top: 245,
                      child: SizedBox(
                        width: sizeDevice.width,
                        child: Text(
                          '${args.title}',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'TitleNewsRoslab',
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                        ),
                      ))
                ],
              )
            ],
          ),
          Positioned(
            top: 330,
            child: Container(
              height: sizeDevice.height,
              width: sizeDevice.width,
              decoration: BoxDecoration(
                  color: Color(0xffFEFDFF),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        '${args.description}',
                        style: TextStyle(
                            fontFamily: 'SourceSans', fontSize: 19, height: 2),
                      ))
                ],
              ),
            ),
          ),
          Positioned(top: 30, child: ActionBar(url: args.link)),
          Positioned(top: 690, child: ShadowMessage()),
          Positioned(
              top: 650,
              left: 200,
              child: ButtonSourceNews(
                url: args.link.toString(),
              ))
        ],
      ),
    );
  }
}

class ActionBar extends StatelessWidget {
  final String url;
  ActionBar({required this.url});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xD8D9CF), shape: CircleBorder()),
              child: Center(
                  child: Icon(
                Icons.arrow_back_ios,
                size: 18,
              ))),
          SizedBox(
            width: 250,
          ),
          ElevatedButton(
              onPressed: () {
                print('Link Share:${url.toString()}');
                shareNews(url);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xD8D9CF), shape: CircleBorder()),
              child: Center(
                  child: Icon(
                Icons.share,
                size: 18,
              )))
        ],
      ),
    );
  }

  Future shareNews(String urlNews) async {
    await Share.share(urlNews);
  }
}

class ShadowMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sizeDevice = MediaQuery.of(context).size;
    return Container(
      height: 350,
      width: sizeDevice.width,
      padding: const EdgeInsets.all(5.0),
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Colors.black.withAlpha(0),
            Colors.black12,
            Colors.black
          ],
        ),
      ),
    );
  }
}

class ButtonSourceNews extends StatelessWidget {
  final String url;

  ButtonSourceNews({required this.url});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
            onPressed: () async {
              await _launchUrl(url);
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.blue,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            child: Text(
              'Baca Selengkapnya',
              style: TextStyle(color: Colors.white),
            )),
      ),
    );
  }

  Future _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (await canLaunchUrl(_url)) {
      await launchUrl(_url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch ${_url}';
    }
  }
}
