import 'dart:convert';

import 'package:newstech/data/dataold.dart';
import 'package:newstech/model/news.dart';
import 'package:http/http.dart' as http;


class Presenter {
  List<NewsModel>? listNews;
  Future<List<NewsModel>?> getNewsApi() async {
    Uri url = Uri.parse(
        "https://newsdata.io/api/1/news?country=id&category=technology&apikey=pub_30118bcaaf1bad5561835f87ae8bb86523589");

    final response = await http.get(url);

    if (response.statusCode != 200) {
      return null;
    } else {
      final List<dynamic> jsonData = jsonDecode(response.body)['results'];

      listNews =
          jsonData.map((newsJson) => NewsModel.fromJson(newsJson)).toList();
      return listNews;
    }
  }
}

