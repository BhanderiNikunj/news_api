import 'package:flutter/material.dart';
import 'package:news_api/Screen/News/Provider/NewsProvider.dart';
import 'package:news_api/Screen/News/View/NewsScreen.dart';
import 'package:news_api/Screen/NewsDetail/View/NewsDetail.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NewsProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => NewsScreen(),
          'detail':(context) => NewsDetail(),
          'view':(context) => NewsDetail(),
        },
      ),
    ),
  );
}
