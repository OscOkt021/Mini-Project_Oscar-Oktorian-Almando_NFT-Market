import 'package:flutter/material.dart';
import 'package:mini_project_nft_market/models/content.dart';
import 'package:mini_project_nft_market/presentation/content/contents_view.dart';

// ignore: unused_import
import 'package:mini_project_nft_market/presentation/content/detail_view.dart';
import 'package:mini_project_nft_market/widgets/gradient_icon.dart';

class ContentPopular extends StatelessWidget {
  ContentPopular({
    Key? key,
    required this.future,
    required this.text,
  }) : super(key: key);

  final String text;
  final gradient = const LinearGradient(
    colors: <Color>[
      Colors.purple,
      Colors.pink,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  final Content karya = Content(
    description: "Just a sample",
    imgUrl:
        "https://media.marketrealist.com/brand-img/OtC_tLFJZ/1600x838/nft-black-1617959604349.jpg",
    creatorId: 1,
    price: 0.009,
    title: "Sample",
  );

  final Future<Content> future;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Content>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // return const Center(
          //   child: CircularProgressIndicator(),
          // );
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return const ItemView();
                  },
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    final tween = Tween(begin: 0.0, end: 1.0);

                    return FadeTransition(
                      opacity: animation.drive(tween),
                      child: child,
                    );
                  },
                ),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.white70, width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 5,
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width * 0.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(karya.imgUrl),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    )),
                    GradientText(
                      text,
                      gradient: gradient,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: "Saira Condensed",
                        fontSize: 25,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }

        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) {
                  return const ItemView();
                },
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  final tween = Tween(begin: 0.0, end: 1.0);

                  return FadeTransition(
                    opacity: animation.drive(tween),
                    child: child,
                  );
                },
              ),
            );
          },
          child: Card(
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.white70, width: 1),
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 5,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      // child: Center(child: widget),
                      child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(snapshot.data!.imgUrl),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  )),
                  GradientText(
                    text,
                    gradient: gradient,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: "Saira Condensed",
                      fontSize: 25,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
