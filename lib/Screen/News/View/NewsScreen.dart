import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_api/Screen/News/Provider/NewsProvider.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  NewsProvider? newsProviderTrue;
  NewsProvider? newsProviderFalse;

  @override
  void initState() {
    super.initState();

    Provider.of<NewsProvider>(context, listen: false).NewsFromJson();
  }

  @override
  Widget build(BuildContext context) {
    newsProviderFalse = Provider.of<NewsProvider>(context, listen: false);
    newsProviderTrue = Provider.of<NewsProvider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          title: Text(
            "Daily News",
            style: GoogleFonts.oranienbaum(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Icon(
              Icons.notification_add_outlined,
              color: Colors.black,
            ),
            SizedBox(width: 30),
          ],
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: CarouselSlider(
                  items: newsProviderFalse!.newsModel!.articles!
                      .asMap()
                      .entries
                      .map(
                        (e) => Container(
                          width: double.infinity,
                          height: 200,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.network(
                                "${newsProviderFalse!.newsModel!.articles![e.key].urlToImage}",
                                fit: BoxFit.cover,
                                height: 250),
                          ),
                        ),
                      )
                      .toList(),
                  options: CarouselOptions(
                    height: 250,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ),
            ];
          },
          body: newsProviderFalse!.newsModel == null
              ? Container()
              : ListView.builder(
                  itemCount: newsProviderFalse!.newsModel!.articles!.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, 'detail',arguments: index);
                          },
                          child: Container(
                            height: 200,
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 200,
                                  width: 250,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${newsProviderFalse!.newsModel!.articles![index].s1!.name}",
                                        style: GoogleFonts.oranienbaum(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Text(
                                        "${newsProviderFalse!.newsModel!.articles![index].publishedAt}",
                                        style: GoogleFonts.oranienbaum(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    "${newsProviderFalse!.newsModel!.articles![index].urlToImage}",
                                    height: 140,
                                    width: 140,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          height: 5,
                          color: Colors.black54,
                          endIndent: 50,
                          indent: 50,
                          thickness: 2,
                        ),
                      ],
                    );
                  },
                ),
        ),
      ),
    );
  }
}
