import 'package:flutter/material.dart';
import 'package:mini_project_nft_market/presentation/home/home.dart';

// import 'package:mini_project_nft_market/presentation/details/detail_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "NFT Market",
      themeMode: ThemeMode.dark,
      home: MyHomeMobile(),
      // home: DashboardPage(),
      // home: HomeJustTest(),
      // home: ListCreator(),
    );
  }
}
