import 'package:flutter/material.dart';
import 'package:simple_animations/stateless_animation/mirror_animation.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  final Image image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0),
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 350,
              height: 350,
              // child: image,
              child: MirrorAnimation(
                builder: (context, child, double value) {
                  return Transform.translate(
                    // offset: Offset.fromDirection(value),
                    offset: Offset(0, value),
                    child: image,
                  );
                },
                duration: const Duration(seconds: 1),
                tween: Tween<double>(begin: 0, end: 10),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: "Saira Condensed",
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final List<Widget> card = [
  HomeCard(
      image: Image.asset("assets/images/card/Discover.png"),
      title: "Discover Digital Art"),
  HomeCard(
      image: Image.asset("assets/images/card/Opportunity.png"),
      title: "Dont Miss your oportunity"),
  HomeCard(
      image: Image.asset("assets/images/card/artist.png"),
      title: "You are an Artist!"),
];
