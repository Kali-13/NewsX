import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:widgets/view/view.dart';

class QueryBar extends StatelessWidget {
  const QueryBar({super.key});

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
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("asset/earth.gif"), fit: BoxFit.cover),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              height: 55,
              child: Hero(
                  tag: "button",
                  child: CupertinoSearchTextField(
                    style: const TextStyle(color: Colors.white),
                    backgroundColor: Colors.white.withAlpha(300),
                    placeholder: "Search Any News",

                    itemColor: Colors.white,
                    // decoration: BoxDecoration(),
                    onSubmitted: (value) {
                      if (value.isEmpty) {
                        showCupertinoDialog(
                            context: context,
                            builder: (context) {
                              return CupertinoAlertDialog(
                                title: const Text('ERROR'),
                                content:
                                    const Text('Enter Any Topic to Search'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('OK'),
                                  )
                                ],
                              );
                            });
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen(query: value)),
                        );
                      }
                    },
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
