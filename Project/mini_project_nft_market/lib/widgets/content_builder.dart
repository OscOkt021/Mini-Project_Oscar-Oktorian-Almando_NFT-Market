import 'package:flutter/material.dart';

import 'package:mini_project_nft_market/models/content.dart';
import 'package:mini_project_nft_market/models/creator.dart';
import 'package:mini_project_nft_market/presentation/details/detail_view.dart';
import 'package:mini_project_nft_market/services/sql/nft_sql.dart';

class ContentBuilder extends StatelessWidget {
  const ContentBuilder({
    Key? key,
    required this.future,
    required this.onEdit,
    required this.onDelete,
  }) : super(key: key);

  final Future<List<Content>> future;
  final Function(Content) onEdit;
  final Function(Content) onDelete;

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
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
          child: GridView.count(
            crossAxisCount: 3,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(
              snapshot.data!.length,
              (index) {
                final content = snapshot.data![index];
                final gambar = content.imgUrl;
                return Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return DetailView(
                          content: content,
                        );
                      }));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(gambar != ""
                              ? gambar
                              : "https://media.sketchfab.com/models/f6ddbea69b364ea19ef9986894004fc0/thumbnails/adbc9230ab9f49c3abf55bdef1c1d25f/2b590f8f02794abbbfabd6d484dfa9d5.jpeg"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
