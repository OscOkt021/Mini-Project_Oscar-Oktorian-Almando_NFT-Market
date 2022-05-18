import 'package:flutter/material.dart';
import 'package:mini_project_nft_market/models/content.dart';
import 'package:mini_project_nft_market/widgets/gradient_icon.dart';
import 'package:mini_project_nft_market/widgets/image_page.dart';

class DetailView extends StatefulWidget {
  const DetailView({
    Key? key,
    required this.content,
  }) : super(key: key);

  final Content content;

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
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
    return SafeArea(
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            const Image(
              image: AssetImage("assets/images/bg/bg1.jpg"),
              fit: BoxFit.cover,
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.08),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.purple[300],
                              shape: const CircleBorder(),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.navigate_before,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.all(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Stack(
                          children: [
                            GestureDetector(
                              child: Image(
                                image: NetworkImage(widget.content.imgUrl),
                              ),
                              onLongPress: () {
                                Navigator.of(context).push(
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation,
                                        secondaryAnimation) {
                                      return ImagePage(
                                          imgUrl: widget.content.imgUrl);
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
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      GradientIcon(
                                        icon: Icons.add,
                                        gradient: gradient,
                                      ),
                                      GradientIcon(
                                        icon: Icons.share,
                                        gradient: gradient,
                                      ),
                                      GradientIcon(
                                        icon: Icons.favorite_border_outlined,
                                        gradient: gradient,
                                      ),
                                    ]),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    GradientText(widget.content.title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "Saira Condensed",
                          fontSize: 35,
                        ),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.purple, Colors.pink],
                        )),
                    SingleChildScrollView(
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: Text(
                          widget.content.description,
                          overflow: TextOverflow.fade,
                          maxLines: 2,
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: "Saira Condensed",
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircleAvatar(
                          radius: 25.0,
                          backgroundImage: NetworkImage(
                              'https://www.tutorialkart.com/img/hummingbird.png'),
                          backgroundColor: Colors.transparent,
                        ),
                        ListTile(
                          title: Center(
                            child: Text(
                              "Who",
                              style: TextStyle(
                                fontFamily: "Saira Condensed",
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          subtitle: Center(
                            child: Text(
                              "Artist",
                              style: TextStyle(
                                fontFamily: "Saira Condensed",
                                fontWeight: FontWeight.w600,
                                color: Colors.white38,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              const Icon(
                                Icons.currency_bitcoin,
                                color: Colors.white,
                              ),
                              Text(
                                "${widget.content.price}",
                                style: const TextStyle(
                                  fontFamily: "Saira Condensed",
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: const [
                              Icon(
                                Icons.date_range,
                                color: Colors.white,
                              ),
                              Text(
                                "21-04-2022",
                                style: TextStyle(
                                  fontFamily: "Saira Condensed",
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: const [
                              Icon(
                                Icons.favorite_rounded,
                                color: Colors.white,
                              ),
                              Text(
                                "28",
                                style: TextStyle(
                                  fontFamily: "Saira Condensed",
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(0.0),
                          elevation: 5,
                        ),
                        onPressed: () {},
                        child: Ink(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.purple, Colors.pink]),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            constraints: const BoxConstraints(minWidth: 88.0),
                            child: const Text(
                              'Place a Bid',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
