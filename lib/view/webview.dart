import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebVie extends StatefulWidget {
  WebVie({required this.url, super.key});
  String url;

  @override
  State<WebVie> createState() => _WebViewState();
}

class _WebViewState extends State<WebVie> {
  @override
  void initState() {
    widget.url.contains("http:")
        ? widget.url.replaceAll("http:", 'https:')
        : widget.url;
    super.initState();
  }

  var loadingPercentage = 0;
  final Completer<WebViewController> con = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          style: GoogleFonts.foldit(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: widget.url,
            onPageStarted: (url) {
              setState(() {
                loadingPercentage = 0;
              });
            },
            onProgress: (progress) {
              setState(() {
                loadingPercentage = progress;
              });
            },
            onPageFinished: (url) {
              setState(() {
                loadingPercentage = 100;
              });
            },
          ),
          if (loadingPercentage < 100)
            LinearProgressIndicator(
              value: loadingPercentage / 100.0,
              color: Colors.black,
              backgroundColor: Colors.white,
            ),
        ],
      ),
    );
  }
}
