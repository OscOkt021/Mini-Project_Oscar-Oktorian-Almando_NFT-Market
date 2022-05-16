import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mini_project_nft_market/presentation/creator/creator_form.dart';
import 'package:mini_project_nft_market/presentation/creator/list_creator.dart';
import 'package:mini_project_nft_market/presentation/content/content_form.dart';
import 'package:mini_project_nft_market/presentation/content/contents_view.dart';
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

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1), () {
      setState(() {
        hour = DateTime.now().hour;
        minute = DateTime.now().minute;
        second = DateTime.now().second;
      });
    });

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
                        Expanded(
                          child: Center(
                            child: Text(
                              '$hour : $minute : $second',
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: "Saira Condensed",
                                fontSize: 20,
                              ),
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
                            onPressed: () {},
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
                          // child: Text(
                          //   "The Biggest \nCollection of NFT's",
                          //   style: TextStyle(
                          //     color: Colors.white,
                          //     fontFamily: "Saira Condensed",
                          //     fontSize: 40,
                          //   ),
                          // ),
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
                          // ContentBuilderHorizontal(
                          //     future: _getContents(), indeks: 1),

                          // contentBuild(0),
                          // contentBuild(1),
                          // contentBuild(2),

                          const CardItem(
                            imgUrl:
                                "https://barkpost-assets.s3.amazonaws.com/wp-content/uploads/2013/11/plainDoge.jpg",
                            text: "Explore",
                          ),
                          const CardItem(
                            imgUrl:
                                "https://1734811051.rsc.cdn77.org/data/images/full/397890/elon-musk-meet-chinese-doppelg-nger-elon-musk-yilong-ma.png?w=600?w=650",
                            text: "It",
                          ),
                          const CardItem(
                            imgUrl:
                                "https://politicsandwar.com/uploads/4d9aee1eb2b42d5ac53a288ce9705b1303e5264e1000x56217.jpeg",
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
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return const ItemView();
                                }));
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
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return const ListCreator();
                              }));
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
