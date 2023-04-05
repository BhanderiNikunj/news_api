import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_api/Screen/News/Provider/NewsProvider.dart';
import 'package:provider/provider.dart';

class NewsDetail extends StatefulWidget {
  const NewsDetail({Key? key}) : super(key: key);

  @override
  State<NewsDetail> createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  NewsProvider? newsProviderTrue;
  NewsProvider? newsProviderFalse;

  @override
  Widget build(BuildContext context) {
    newsProviderFalse = Provider.of<NewsProvider>(context, listen: false);
    newsProviderTrue = Provider.of<NewsProvider>(context, listen: true);

    int index = ModalRoute.of(context)!.settings.arguments as int;

    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 400,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                child: Image.network(
                  "${newsProviderFalse!.newsModel!.articles![index].urlToImage}",
                  fit: BoxFit.cover,
                ),
              ),
              width: double.infinity,
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${newsProviderFalse!.newsModel!.articles![index].s1.id}",
                    style: GoogleFonts.oranienbaum(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "${newsProviderFalse!.newsModel!.articles![index].title}",
                    style: GoogleFonts.oranienbaum(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "${newsProviderFalse!.newsModel!.articles![index].description}",
                    style: GoogleFonts.oranienbaum(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30),
                  Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, 'view');
                      },
                      child: Container(
                        height: 50,width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.black26,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
