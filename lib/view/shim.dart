import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Shim extends StatelessWidget {
  const Shim({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(0.25),
            highlightColor: Colors.white.withOpacity(0.6),
            child: Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey.withOpacity(0.9),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            padding: const EdgeInsets.all(14),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                skeleton(),
                SizedBox(
                  height: 5,
                ),
                skeleton(),
                SizedBox(
                  height: 8,
                ),
                SizedBox(
                  width: 105,
                  child: skeleton(),
                ),
                SizedBox(
                  height: 25,
                ),
                skeleton(),
                SizedBox(
                  height: 5,
                ),
                skeleton(),
                SizedBox(
                  height: 5,
                ),
                skeleton(),
                SizedBox(
                  height: 5,
                ),
                skeleton()
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
                  margin: const EdgeInsets.only(bottom: 15),
                  width: 100,
                  height: 40,
                  child: const skeleton(),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class skeleton extends StatelessWidget {
  const skeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.25),
      highlightColor: Colors.white.withOpacity(0.6),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.9),
            borderRadius: const BorderRadius.all(Radius.circular(18))),
        padding: const EdgeInsets.all(13),
      ),
    );
  }
}
