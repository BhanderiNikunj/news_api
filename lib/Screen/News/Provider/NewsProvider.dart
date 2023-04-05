import 'package:flutter/material.dart';
import 'package:news_api/Screen/News/Model/NewsModel.dart';
import 'package:news_api/Utiles/ApiHelper.dart';

class NewsProvider extends ChangeNotifier {
  Apihelper apihelper = Apihelper();
  NewsModel? newsModel;
  Future<void> NewsFromJson() async {

    NewsModel n1 = await apihelper.NewsApiCall();
    newsModel = n1;
    notifyListeners();
  }
}
