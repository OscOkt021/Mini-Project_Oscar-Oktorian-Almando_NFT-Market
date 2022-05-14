import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:mini_project_nft_market/models/content.dart';
import 'package:mini_project_nft_market/models/creator.dart';
import 'package:mini_project_nft_market/presentation/home/home.dart';
import 'package:mini_project_nft_market/services/sql/nft_sql.dart';

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
  final DatabaseService _databaseService = DatabaseService();

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
                      padding: EdgeInsets.all(4.0),
                      child: Row(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.purple[300],
                              shape: CircleBorder(),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
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
                            Image(
                              image: NetworkImage(widget.content.imgUrl),
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
                                      GradientIconButton(
                                        onpressed: () {
                                          // Navigator.of(context).push(
                                          //   MaterialPageRoute(builder: (context) {
                                          //     return MyHomeMobile();
                                          //   }),
                                          // );
                                        },
                                      ),
                                      GradientIconButton(
                                        icon: Icons.share,
                                        onpressed: () {},
                                      ),
                                      GradientIconButton(
                                        icon: Icons.favorite_border,
                                        onpressed: () {},
                                      ),
                                    ]),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    GradientText(widget.content.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Saira Condensed",
                          fontSize: 35,
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Colors.purple, Colors.pink],
                        )),
                    SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Text(
                          widget.content.description,
                          overflow: TextOverflow.fade,
                          maxLines: 2,
                          style: TextStyle(
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
                      children: [
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
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Icon(
                                Icons.currency_bitcoin,
                                color: Colors.white,
                              ),
                              Text(
                                "${widget.content.price}",
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
                            children: [
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
                            children: [
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
                      margin: EdgeInsets.symmetric(vertical: 20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(0.0),
                          elevation: 5,
                        ),
                        onPressed: () {},
                        child: Ink(
                          decoration: BoxDecoration(
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

class GradientIconButton extends StatelessWidget {
  const GradientIconButton({
    Key? key,
    this.icon = Icons.add,
    this.onpressed,
  }) : super(key: key);

  final IconData icon;
  final void Function()? onpressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Container(
        foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.purple, Colors.pink],
            ),
            backgroundBlendMode: BlendMode.screen),
        child: Icon(
          icon,
        ),
      ),
      iconSize: 36,
      color: Colors.black,
      onPressed: onpressed,
    );
  }
}

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    required this.gradient,
    this.style,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}
