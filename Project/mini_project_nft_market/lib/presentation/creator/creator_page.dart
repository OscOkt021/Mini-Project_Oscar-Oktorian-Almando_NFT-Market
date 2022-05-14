import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:mini_project_nft_market/models/content.dart';
import 'package:mini_project_nft_market/presentation/details/content_form.dart';
import 'package:mini_project_nft_market/presentation/details/detail_view.dart';
import 'package:mini_project_nft_market/services/sql/nft_sql.dart';
import 'package:mini_project_nft_market/widgets/content_builder.dart';

class CreatorPage extends StatefulWidget {
  const CreatorPage({
    Key? key,
    required this.imgProfile,
    required this.username,
    required this.userId,
  }) : super(key: key);

  final String imgProfile;
  final String username;
  final int userId;

  @override
  State<CreatorPage> createState() => _CreatorPageState();
}

class _CreatorPageState extends State<CreatorPage> {
  final DatabaseService _databaseService = DatabaseService();

  Future<List<Content>> _getContents() async {
    return await _databaseService.content();
  }

  Future<List<Content>> _getContentsFromUsers(int id) async {
    return await _databaseService.contentWithId(id);
  }

  Future<void> _onContentDelete(Content content) async {
    await _databaseService.deleteContent(content.id!);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(),
        body: Stack(
          fit: StackFit.expand,
          children: [
            const Image(
              image: AssetImage("assets/images/bg/bg1.jpg"),
              fit: BoxFit.cover,
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      BlurryContainer(
                        blur: 6,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        padding: EdgeInsets.zero,
                        height: MediaQuery.of(context).size.width * 0.5,
                        width: MediaQuery.of(context).size.width,
                        child: Container(
                            height: double.infinity,
                            decoration: new BoxDecoration(
                              image: new DecorationImage(
                                image: NetworkImage(widget.imgProfile),
                                fit: BoxFit.fitWidth,
                              ),
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.all(4.0),
                        child: ElevatedButton(
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
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(
                              top: (MediaQuery.of(context).size.width * 0.5) -
                                  30),
                          child: CircleAvatar(
                            radius: 40.0,
                            backgroundImage: NetworkImage(widget.imgProfile),
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: GradientText(widget.username,
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
                  ),
                  Text(
                    "Collections",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Saira Condensed",
                      fontSize: 25,
                    ),
                  ),
                  // GridView.count(
                  //   crossAxisCount: 3,
                  //   crossAxisSpacing: 5.0,
                  //   mainAxisSpacing: 5.0,
                  //   shrinkWrap: true,
                  //   scrollDirection: Axis.vertical,
                  //   physics: NeverScrollableScrollPhysics(),
                  //   children: List.generate(
                  //     20,
                  //     (index) {
                  //       return Padding(
                  //         padding: const EdgeInsets.all(10.0),
                  //         child: GestureDetector(
                  //           onTap: () {
                  //             Navigator.of(context).push(
                  //               PageRouteBuilder(
                  //                 pageBuilder:
                  //                     (context, animation, secondaryAnimation) {
                  //                   return DetailView();
                  //                 },
                  //                 transitionsBuilder: (context, animation,
                  //                     secondaryAnimation, child) {
                  //                   final tween = Tween(
                  //                       begin: const Offset(0, .5),
                  //                       end: Offset.zero);

                  //                   return SlideTransition(
                  //                     position: animation.drive(tween),
                  //                     child: child,
                  //                   );
                  //                 },
                  //               ),
                  //             );
                  //           },
                  //           child: Container(
                  //             decoration: BoxDecoration(
                  //               image: DecorationImage(
                  //                 image: NetworkImage(
                  //                     'https://www.tutorialkart.com/img/hummingbird.png'),
                  //                 fit: BoxFit.cover,
                  //               ),
                  //               borderRadius: BorderRadius.all(
                  //                 Radius.circular(20.0),
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       );
                  //     },
                  //   ),
                  // ),
                  ContentBuilder(
                    future: _getContentsFromUsers(widget.userId),
                    onEdit: (value) {
                      {
                        Navigator.of(context)
                            .push(
                              MaterialPageRoute(
                                builder: (_) => ContentForm(),
                                fullscreenDialog: true,
                              ),
                            )
                            .then((_) => setState(() {}));
                      }
                    },
                    onDelete: _onContentDelete,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
