import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mini_project_nft_market/models/content.dart';
import 'package:mini_project_nft_market/models/creator.dart';
import 'package:mini_project_nft_market/presentation/ViewModel/content_creator_view_model.dart';
import 'package:mini_project_nft_market/presentation/creator/creator_form.dart';
import 'package:mini_project_nft_market/presentation/creator/list_creator.dart';
import 'package:mini_project_nft_market/presentation/content/content_form.dart';
import 'package:mini_project_nft_market/presentation/content/contents_view.dart';
import 'package:mini_project_nft_market/presentation/home/home.dart';
import 'package:mini_project_nft_market/services/sql/nft_sql.dart';
import 'package:mini_project_nft_market/widgets/content_popular.dart';
import 'package:mini_project_nft_market/widgets/gradient_icon.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final gradient = const LinearGradient(
    colors: <Color>[
      Colors.purple,
      Colors.pink,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  var hour = DateTime.now().hour;
  var minute = DateTime.now().minute;
  var second = DateTime.now().second;

  Future<bool> _onWillPop() async {
    return false; //<-- SEE HERE
  }

  final DatabaseService _databaseService = DatabaseService();
  final ContentCreatorVM ccvm = ContentCreatorVM();

  final Creator hanyaCreator = Creator(
      nickName: "Osc",
      realName: "Oscar",
      imgProfile:
          "https://lh3.googleusercontent.com/_2Pq-UfIwLhEWPsgJjotqge32BdcDYuCvaSQjpJNu7kX20JiMHdwe8M7KhEtwI2aQabForu1UvdQDKsgs-XtoVte9_kITcK-vt04KA=w1400-k",
      about: "Just a sample");

  final List<Content> isiContent = [
    Content(
      description: "Testing",
      imgUrl:
          "https://d1muf25xaso8hp.cloudfront.net/https://s3.amazonaws.com/appforest_uf/f1611920662973x977283649016331500/AdobeStock_334049275_1.jpg?w=&h=&auto=compress&dpr=1&fit=max",
      creatorId: 1,
      price: 0.00001,
      title: "Sample",
    ),
    Content(
      description: "Testing",
      imgUrl:
          "https://media.marketrealist.com/brand-img/OtC_tLFJZ/1600x838/nft-black-1617959604349.jpg",
      creatorId: 1,
      price: 0.00001,
      title: "Sample 2",
    ),
    Content(
      description: "Testing",
      imgUrl:
          "https://darqtec.com/wp-content/uploads/2021/03/NFT-Purple-768x576.jpg",
      creatorId: 1,
      price: 0.00001,
      title: "Sample 3",
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    _databaseService.insertCreator(hanyaCreator);

    _databaseService.insertContent(isiContent[0]);
    _databaseService.insertContent(isiContent[1]);
    _databaseService.insertContent(isiContent[2]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Future.delayed(const Duration(milliseconds: 1), () {
    //   setState(() {
    //     hour = DateTime.now().hour;
    //     minute = DateTime.now().minute;
    //     second = DateTime.now().second;
    //   });
    // });

    // });
    return SafeArea(
      child: WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              const Image(
                image: AssetImage("assets/images/bg/bg1.jpg"),
                fit: BoxFit.cover,
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 8,
                        ),
                        const Expanded(
                          child: Text(
                            "NFT Collection",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Saira Condensed",
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.purple[300],
                              shape: const CircleBorder(),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                PageRouteBuilder(
                                  pageBuilder:
                                      (context, animation, secondaryAnimation) {
                                    return const MyHomeMobile();
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
                            child: const Text("A"),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: GradientText(
                            "The Biggest \nCollection of NFT's",
                            gradient: gradient,
                            style: const TextStyle(
                              // color: Colors.white,
                              fontFamily: "Saira Condensed",
                              fontSize: 40,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Popular Now",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Saira Condensed",
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 5),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(children: [
                          ContentPopular(
                            future: ccvm.getContent(1),
                            text: "Explore",
                          ),
                          ContentPopular(
                            future: ccvm.getContent(2),
                            text: "It",
                          ),
                          ContentPopular(
                            future: ccvm.getContent(3),
                            text: "Now!",
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.purple[300],
                                shape: const CircleBorder(),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation,
                                        secondaryAnimation) {
                                      return const ItemView();
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
                              child: const Icon(
                                Icons.navigate_next,
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 8.0),
                          child: Text(
                            "CREATOR",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Saira Condensed",
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Text(
                            "Explore Creators!",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Saira Condensed",
                              fontSize: 20,
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.purple[300],
                              shape: const CircleBorder(),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(
                                PageRouteBuilder(
                                  pageBuilder:
                                      (context, animation, secondaryAnimation) {
                                    return const ListCreator();
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
                            child: const Icon(
                              Icons.navigate_next,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(
                        MaterialPageRoute(
                          builder: (_) => const ContentForm(),
                          fullscreenDialog: true,
                        ),
                      )
                      .then((_) => setState(() {}));
                },
                heroTag: 'addContent',
                child: Container(
                  width: 60,
                  height: 60,
                  child: const Icon(
                    Icons.add,
                    size: 40,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: gradient,
                  ),
                ),
              ),
              const SizedBox(height: 12.0),
              FloatingActionButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(
                        MaterialPageRoute(
                          builder: (_) => const CreatorForm(),
                          fullscreenDialog: true,
                        ),
                      )
                      .then((_) => setState(() {}));
                },
                heroTag: 'addCreator',
                child: Container(
                  width: 60,
                  height: 60,
                  child: const Center(child: FaIcon(FontAwesomeIcons.userPlus)),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: gradient,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem(
      {Key? key,
      this.widget = const CircularProgressIndicator(),
      required this.imgUrl,
      this.text = "Halo"})
      : super(key: key);

  final Widget widget;
  final String imgUrl;
  final String text;
  final gradient = const LinearGradient(
    colors: <Color>[
      Colors.purple,
      Colors.pink,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return const ItemView();
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
      child: Card(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.white70, width: 1),
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 5,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          width: MediaQuery.of(context).size.width * 0.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  // child: Center(child: widget),
                  child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imgUrl),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              )),
              GradientText(
                text,
                gradient: gradient,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: "Saira Condensed",
                  fontSize: 25,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Badge extends StatelessWidget {
  const Badge({
    Key? key,
    this.icon = Icons.add_alert,
    this.text = "Trending",
    this.color = Colors.grey,
  }) : super(key: key);

  final IconData icon;
  final MaterialColor color;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: color,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: () {},
      child: Row(children: [
        Icon(icon),
        const SizedBox(
          width: 5,
        ),
        Text(text)
      ]),
    );
  }
}
