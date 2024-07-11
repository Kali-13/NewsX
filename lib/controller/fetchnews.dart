import 'dart:math';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:widgets/model/fetchnews.dart';

final rand = new Random();

class FetchX {
  static Future<FetchN> fetchNews({required String search}) async {
    // var sourceId = sourceIn[rand.nextInt(sourceIn.length)];
    var response = await http.get(Uri.parse(
        "https://newsapi.org/v2/everything?q= $search &language=en&apiKey=383a252486b14c35b197734eca056f96"));
    var data = json.decode(response.body);
    var articles = data['articles'];

    var news = articles[rand.nextInt(articles.length)];
    return FetchN.fetchNews(news);
  }
}
