import 'package:flutter/material.dart';
import 'package:mini_project_nft_market/presentation/dashboard_page/dashboard_page.dart';
import 'package:mini_project_nft_market/presentation/creator/list_creator.dart';
import 'package:mini_project_nft_market/presentation/for_testing/main_testing_lit.dart';
import 'package:mini_project_nft_market/presentation/home/home.dart';

import 'package:mini_project_nft_market/presentation/login/login_page.dart';

// import 'package:mini_project_nft_market/presentation/details/detail_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "NFT Market",
      themeMode: ThemeMode.dark,
      // home: MyHomeMobile(),
      home: DashboardPage(),
      // home: HomeJustTest(),
      // home: ListCreator(),
    );
  }
}
