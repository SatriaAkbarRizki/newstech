import 'dart:convert';

import 'package:newstech/model/news.dart';
import 'package:http/http.dart' as http;

class Presenter {
  List<NewsModel>? listNews;

  Future<List<NewsModel>?> getNewsApi() async {
    Uri url = Uri.parse(
        "https://newsdata.io/api/1/news?country=id&category=technology&apikey=pub_30118baebf25a92e4dfebd46668860418918b");

    final response = await http.get(url);

    if (response.statusCode != 200) {
      return null;
    } else {
      final List<dynamic> jsonData = jsonDecode(response.body)['results'];
      // print(jsonData);
      listNews =
          jsonData.map((newsJson) => NewsModel.fromJson(newsJson)).toList();
      return listNews;
    }
  }
}
