import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mini_project_nft_market/models/content.dart';
import 'package:mini_project_nft_market/models/creator.dart';
import 'package:mini_project_nft_market/presentation/creator/creator_form.dart';
import 'package:mini_project_nft_market/presentation/creator/creator_page.dart';
import 'package:mini_project_nft_market/presentation/creator/list_creator.dart';
import 'package:mini_project_nft_market/presentation/details/content_form.dart';
import 'package:mini_project_nft_market/presentation/details/detail_view.dart';
import 'package:mini_project_nft_market/presentation/details/contents_view.dart';
import 'package:mini_project_nft_market/services/sql/nft_sql.dart';
import 'package:mini_project_nft_market/widgets/content_builder_horizontal.dart';
import 'package:mini_project_nft_market/widgets/creator_builder.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final DatabaseService _databaseService = DatabaseService();

  // Future<List<Creator>> _getCreators() async {
  //   return await _databaseService.creators();
  // }
  Widget contentBuild(int i) {
    return FutureBuilder<List<Content>>(
      future: _getContents(),
      builder: (context, snapshot) {
        return CardItem(imgUrl: snapshot.data![i].imgUrl);
      },
    );
  }

  var hour = DateTime.now().hour;
  var minute = DateTime.now().minute;
  var second = DateTime.now().second;

  Future<bool> _onWillPop() async {
    return false; //<-- SEE HERE
  }

  Future<List<Content>> _getContents() async {
    return await _databaseService.content();
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
              Image(
                image: AssetImage("assets/images/bg/bg1.jpg"),
                fit: BoxFit.cover,
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
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
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Saira Condensed",
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(4.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.purple[300],
                              shape: CircleBorder(),
                            ),
                            onPressed: () {},
                            child: Text("A"),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "The Biggest \nCollection of NFT's",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Saira Condensed",
                              fontSize: 40,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
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
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(children: [
                          // ContentBuilderHorizontal(
                          //     future: _getContents(), indeks: 1),

                          contentBuild(0),
                          contentBuild(1),
                          contentBuild(2),

                          // CardItem(),

                          Padding(
                            padding: EdgeInsets.all(4.0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.purple[300],
                                shape: CircleBorder(),
                              ),
                              onPressed: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return ItemView();
                                }));
                              },
                              child: Icon(
                                Icons.navigate_next,
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
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
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
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
                              shape: CircleBorder(),
                            ),
                            onPressed: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return ListCreator();
                              }));
                            },
                            child: Icon(
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
                          builder: (_) => ContentForm(),
                          fullscreenDialog: true,
                        ),
                      )
                      .then((_) => setState(() {}));
                },
                heroTag: 'addContent',
                child: FaIcon(FontAwesomeIcons.plus),
              ),
              SizedBox(height: 12.0),
              FloatingActionButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(
                        MaterialPageRoute(
                          builder: (_) => CreatorForm(),
                          fullscreenDialog: true,
                        ),
                      )
                      .then((_) => setState(() {}));
                },
                heroTag: 'addCreator',
                child: FaIcon(FontAwesomeIcons.userPlus),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  const CardItem({
    Key? key,
    this.widget = const CircularProgressIndicator(),
    required this.imgUrl,
  }) : super(key: key);

  final Widget widget;
  final String imgUrl;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).push(
        // PageRouteBuilder(
        //   pageBuilder: (context, animation, secondaryAnimation) {
        //     return DetailView();
        //   },
        //   transitionsBuilder:
        //       (context, animation, secondaryAnimation, child) {
        //     final tween = Tween(begin: const Offset(0, .5), end: Offset.zero);

        //     return SlideTransition(
        //       position: animation.drive(tween),
        //       child: child,
        //     );
        //   },
        // ),
        // );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white70, width: 1),
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 5,
        child: Container(
          height: MediaQuery.of(context).size.height * (25 / 100),
          width: MediaQuery.of(context).size.width * (50 / 100),
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
              ))
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
          side: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: () {},
      child: Row(children: [
        Icon(icon),
        SizedBox(
          width: 5,
        ),
        Text(text)
      ]),
    );
  }
}
