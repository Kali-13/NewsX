import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:widgets/controller/fetchnews.dart';
import 'package:widgets/model/fetchnews.dart';
import 'package:widgets/view/shim.dart';
import 'package:widgets/view/widgets/newscontainer.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({required this.query, super.key});
  String query;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isload = true;

  late FetchN news;

  getNews() async {
    news = await FetchX.fetchNews(search: widget.query);

    setState(() {
      isload = false;
    });
  }

  @override
  void initState() {
    getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.black,
        // extendBodyBehindAppBar: true,
        appBar: AppBar(
          flexibleSpace: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                color: Colors.transparent,
              ),
            ),
          ),
          title: Text(
            "NewsX",
            style:
                GoogleFonts.foldit(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
        ),
        body: PageView.builder(
          onPageChanged: (value) {
            setState(() {
              isload = true;
            });
            getNews();
          },

          itemBuilder: (context, ind) {
            return isload
                ? const Center(child: Shim())
                : XContainer(
                    publishDate: DateFormat("yMMMd")
                        .format(DateTime.parse(news.publishDate)),
                    imaUrl: news.imaUrl,
                    heading: news.heading,
                    desc: news.desc,
                    publishTime: DateFormat("jm")
                        .format(DateTime.parse(news.publishDate)),
                    url: news.url,
                  );
          },
          // itemCount: 10,
          scrollDirection: Axis.vertical,
        ));
  }
}
