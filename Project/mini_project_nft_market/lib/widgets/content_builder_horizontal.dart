import 'package:flutter/material.dart';

import 'package:mini_project_nft_market/models/content.dart';
import 'package:mini_project_nft_market/models/creator.dart';
import 'package:mini_project_nft_market/presentation/details/detail_view.dart';
import 'package:mini_project_nft_market/services/sql/nft_sql.dart';

class ContentBuilderHorizontal extends StatelessWidget {
  const ContentBuilderHorizontal({
    Key? key,
    required this.future,
    required this.indeks,
  }) : super(key: key);
  final Future<List<Content>> future;
  final int indeks;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Content>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        final content = snapshot.data![indeks];
        final gambar = content.imgUrl;
        return GestureDetector(
          onTap: () {
            // Navigator.of(context).push(
            // PageRouteBuilder(
            //   pageBuilder: (context, animation, secondaryAnimation) {
            //     return DetailView();
            //   },
            //   transitionsBuilder:
            //       (context, animation, secondaryAnimation, child) {
            //     final tween = Tween(begin: const Offset(0, .5), end: Offset.zero);

            //     return SlideTransition(
            //       position: animation.drive(tween),
            //       child: child,
            //     );
            //   },
            // ),
            // );
          },
          child: Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.white70, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 5,
            child: Container(
              height: MediaQuery.of(context).size.height * (25 / 100),
              width: MediaQuery.of(context).size.width * (50 / 100),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(gambar),
                  fit: BoxFit.fill,
                ),
              ),
              // child: Column(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Expanded(
              //       child: Center(child: widget),
              //     )
              //   ],
              // ),
            ),
          ),
        );
      },
    );
  }
}
