// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:mini_project_nft_market/models/creator.dart';
import 'package:mini_project_nft_market/presentation/creator/list_creator.dart';

class CreatorOnly extends StatelessWidget {
  CreatorOnly({
    Key? key,
    required this.future,
  }) : super(key: key);

  final Future<Creator> future;

  final Creator me = Creator(
      nickName: "Mr. Sample",
      realName: "Sample Man",
      imgProfile:
          "https://media.marketrealist.com/brand-img/OtC_tLFJZ/1600x838/nft-black-1617959604349.jpg",
      about: "Im just a sample man!");

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Creator>(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // return const Center(
            //   child: CircularProgressIndicator(),
            // );
            return GestureDetector(
              onTap: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 25.0,
                    backgroundImage: NetworkImage(me.imgProfile),
                    backgroundColor: Colors.transparent,
                  ),
                  ListTile(
                    title: Center(
                      child: Text(
                        me.nickName,
                        style: const TextStyle(
                          fontFamily: "Saira Condensed",
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    subtitle: const Center(
                      child: const Text(
                        "Artist",
                        style: TextStyle(
                          fontFamily: "Saira Condensed",
                          fontWeight: FontWeight.w600,
                          color: Colors.white38,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return const ListCreator();
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 25.0,
                  backgroundImage: NetworkImage(snapshot.data!.imgProfile),
                  backgroundColor: Colors.transparent,
                ),
                ListTile(
                  title: Center(
                    child: Text(
                      snapshot.data!.nickName,
                      style: const TextStyle(
                        fontFamily: "Saira Condensed",
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  subtitle: Center(
                    child: Text(
                      snapshot.data!.realName,
                      style: const TextStyle(
                        fontFamily: "Saira Condensed",
                        fontWeight: FontWeight.w600,
                        color: Colors.white38,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
