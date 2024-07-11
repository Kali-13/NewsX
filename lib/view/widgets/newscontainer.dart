import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:widgets/view/webview.dart';

class XContainer extends StatelessWidget {
  XContainer(
      {required this.desc,
      required this.publishDate,
      required this.heading,
      required this.imaUrl,
      required this.publishTime,
      required this.url,
      super.key});
  String imaUrl;
  String heading;
  String desc;
  String publishDate;
  String publishTime;
  String url;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("asset/bgbg.gif"), fit: BoxFit.cover)),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInImage.assetNetwork(
            placeholder: "asset/pl.gif",
            image: imaUrl,
            height: 300,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            imageErrorBuilder: (context, error, stackTrace) {
              return Image.asset("asset/X.webp");
            },
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  heading.length > 100
                      ? "${heading.substring(0, 70)}...."
                      : heading,
                  style:
                      GoogleFonts.newsreader(fontSize: 30, color: Colors.white),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "$publishDate | $publishTime",
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  desc.length > 250 ? "${desc.substring(0, 200)}....." : desc,
                  style: const TextStyle(fontSize: 17, color: Colors.white),
                ),
              ],
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 18),
                  child: Hero(
                    tag: "button",
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WebVie(
                              url: url,
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          textStyle: GoogleFonts.arvo(
                              fontWeight: FontWeight.bold, fontSize: 15)),
                      child: const Text("Read more.."),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          )
        ],
      ),
    );
  }
}
