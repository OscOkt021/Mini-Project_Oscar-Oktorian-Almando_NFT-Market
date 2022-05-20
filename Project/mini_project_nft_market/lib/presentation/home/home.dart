import 'package:card_swiper/card_swiper.dart';
import 'package:mini_project_nft_market/models/content.dart';
import 'package:mini_project_nft_market/models/creator.dart';
import 'package:mini_project_nft_market/services/sql/nft_sql.dart';
import 'package:mini_project_nft_market/widgets/home_card.dart';
import 'package:mini_project_nft_market/presentation/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomeMobile extends StatefulWidget {
  const MyHomeMobile({Key? key}) : super(key: key);

  @override
  State<MyHomeMobile> createState() => _MyHomeMobileState();
}

class _MyHomeMobileState extends State<MyHomeMobile> {
  final Creator hanyaCreator = Creator(
    nickName: "Osc",
    realName: "Oscar",
    imgProfile:
        "https://lh3.googleusercontent.com/_2Pq-UfIwLhEWPsgJjotqge32BdcDYuCvaSQjpJNu7kX20JiMHdwe8M7KhEtwI2aQabForu1UvdQDKsgs-XtoVte9_kITcK-vt04KA=w1400-k",
    about: "Just a sample",
  );

  final List<Content> isiContent = [
    Content(
      description: "Testing",
      imgUrl:
          "https://d1muf25xaso8hp.cloudfront.net/https://s3.amazonaws.com/appforest_uf/f1611920662973x977283649016331500/AdobeStock_334049275_1.jpg?w=&h=&auto=compress&dpr=1&fit=max",
      creatorId: 1,
      price: 0.00001,
      title: "Sample",
      dateCreated: DateTime.now(),
      category: "invest",
    ),
    Content(
      description: "Testing",
      imgUrl:
          "https://media.marketrealist.com/brand-img/OtC_tLFJZ/1600x838/nft-black-1617959604349.jpg",
      creatorId: 1,
      price: 0.00001,
      title: "Sample 2",
      dateCreated: DateTime.now(),
      category: "art",
    ),
    Content(
        description: "Testing",
        imgUrl:
            "https://darqtec.com/wp-content/uploads/2021/03/NFT-Purple-768x576.jpg",
        creatorId: 1,
        price: 0.00001,
        title: "Sample 3",
        dateCreated: DateTime.now(),
        category: "aesthetic"),
    Content(
        description: "Im a Cat",
        imgUrl:
            "https://images.squarespace-cdn.com/content/v1/53a1a597e4b017ac5c2c7f48/1625468272323-UL58RRTNDO4X57Z57UPN/gang.jpg",
        creatorId: 1,
        price: 0.0003,
        title: "Sample 4",
        dateCreated: DateTime.now(),
        category: "art"),
    Content(
        description: "It a good one",
        imgUrl:
            "https://ik.imagekit.io/oyprice/bytes/wp-content/uploads/2021/03/NFT-01-scaled.jpg",
        creatorId: 1,
        price: 0.000013,
        title: "Sample 4",
        dateCreated: DateTime.now(),
        category: "3d"),
    Content(
        description: "Invest It",
        imgUrl:
            "https://www.cloudwards.net/wp-content/uploads/2021/06/NFT-coin.jpg",
        creatorId: 1,
        price: 0.000012,
        title: "Sample 5",
        dateCreated: DateTime.now(),
        category: "invest"),
  ];

  final DatabaseService _databaseService = DatabaseService();

  late SharedPreferences pref;
  late bool newDB;
  void cekDB() async {
    pref = await SharedPreferences.getInstance();
    newDB = pref.getBool('ndb') ?? true;
    if (newDB) {
      _databaseService.insertCreator(hanyaCreator);

      _databaseService.insertContent(isiContent[0]);
      _databaseService.insertContent(isiContent[1]);
      _databaseService.insertContent(isiContent[2]);
      _databaseService.insertContent(isiContent[3]);
      _databaseService.insertContent(isiContent[4]);
      pref.setBool('ndb', false);
    } else {
      // ignore: avoid_print
      print("Data sudah ada");
    }
  }

  @override
  void initState() {
    cekDB();
    //catatan : pake shared preferences!
    super.initState();
  }

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
