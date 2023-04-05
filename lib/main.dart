import 'package:flutter/material.dart';
import 'package:news_api/Screen/News/Provider/NewsProvider.dart';
import 'package:news_api/Screen/News/View/NewsScreen.dart';
import 'package:news_api/Screen/NewsDetail/View/NewsDetail.dart';
import 'package:news_api/Screen/WebView/Provider/WebViewProvider.dart';
import 'package:news_api/Screen/WebView/View/WebViewScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NewsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WebViewProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => NewsScreen(),
          'detail':(context) => NewsDetail(),
          'view':(context) => WebViewScreen(),
        },
      ),
    ),
  );
}
