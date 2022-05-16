import 'package:flutter/material.dart';
import 'package:mini_project_nft_market/models/creator.dart';
import 'package:mini_project_nft_market/presentation/creator/creator_page.dart';

class CreatorBuilder extends StatelessWidget {
  const CreatorBuilder({
    Key? key,
    required this.future,
  }) : super(key: key);
  final Future<List<Creator>> future;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Creator>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final creator = snapshot.data![index];
              // print(creator.realName);
              return _buildBreedCard(creator, context);
            },
          ),
        );
      },
    );
  }

  Widget _buildBreedCard(Creator creator, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return CreatorPage(
                imgProfile: creator.imgProfile,
                username: creator.nickName,
                userId: creator.id!,
              );
            },
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              final tween = Tween(begin: const Offset(0, .5), end: Offset.zero);

              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
          ),
        );
      },
      child: Card(
        color: Colors.purple.withOpacity(0.2),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage(
                  creator.imgProfile != ""
                      ? creator.imgProfile
                      : "https://media.sketchfab.com/models/f6ddbea69b364ea19ef9986894004fc0/thumbnails/adbc9230ab9f49c3abf55bdef1c1d25f/2b590f8f02794abbbfabd6d484dfa9d5.jpeg",
                  scale: 1,
                ),
                backgroundColor: Colors.purple[300],
              ),
              const SizedBox(width: 20.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      creator.nickName != "" ? creator.nickName : "Great",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontFamily: "Saira Condensed",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      creator.about,
                      style: const TextStyle(
                        fontFamily: "Saira Condensed",
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
