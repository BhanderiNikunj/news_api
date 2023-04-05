import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_api/Screen/News/Model/NewsModel.dart';

class Apihelper
{
    Future<NewsModel> NewsApiCall()
    async {
      String link = "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=8081c5d4778d45bcbf5c89c1c0f0be9c";

      Uri uri = Uri.parse(link);

      var result = await http.get(uri);

      var Json = jsonDecode(result.body);

      NewsModel newsModel = NewsModel().NewsFromJson(Json);

      return newsModel;
    }
}