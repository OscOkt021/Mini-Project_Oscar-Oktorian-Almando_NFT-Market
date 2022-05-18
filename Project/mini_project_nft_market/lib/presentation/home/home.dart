import 'package:card_swiper/card_swiper.dart';
import 'package:mini_project_nft_market/widgets/home_card.dart';
import 'package:mini_project_nft_market/presentation/login/login_page.dart';
import 'package:flutter/material.dart';

class MyHomeMobile extends StatelessWidget {
  const MyHomeMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            const Image(
              image: AssetImage("assets/images/bg/bg1.jpg"),
              fit: BoxFit.cover,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(),
                    ),
                  ],
                ),
                Expanded(
                  child: Swiper(
                    itemBuilder: ((context, index) {
                      return card[index];
                    }),
                    itemCount: card.length,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) {
                              return const LoginPage();
                            },
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              final tween = Tween(begin: 0.0, end: 1.0);

                              return FadeTransition(
                                opacity: animation.drive(tween),
                                child: child,
                              );
                            },
                          ),
                        );
                      },
                      child: const Text("Get Started")),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
