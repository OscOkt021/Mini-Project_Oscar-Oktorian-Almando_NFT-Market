import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:mini_project_nft_market/presentation/home/home.dart';
import 'package:page_transition/page_transition.dart';

// import 'package:mini_project_nft_market/presentation/details/detail_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "NFT Market",
      themeMode: ThemeMode.dark,
      // home: MyHomeMobile(),
      // home: DashboardPage(),
      // home: HomeJustTest(),
      // home: ListCreator(),
      home: AnimatedSplashScreen(
        splash: 'assets/images/bg/nft-explorer.png',
        splashIconSize: 170,
        nextScreen: const MyHomeMobile(),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
        backgroundColor: Colors.purple,
      ),
    );
  }
}
