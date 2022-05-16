import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:mini_project_nft_market/models/content.dart';
import 'package:mini_project_nft_market/presentation/ViewModel/content_creator_view_model.dart';
import 'package:mini_project_nft_market/presentation/content/content_form.dart';

import 'package:mini_project_nft_market/services/sql/nft_sql.dart';
import 'package:mini_project_nft_market/widgets/content_builder.dart';
import 'package:mini_project_nft_market/widgets/gradient_icon.dart';

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
  final ContentCreatorVM contentCreatorVM = ContentCreatorVM();
  final DatabaseService _databaseService = DatabaseService();

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
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        padding: EdgeInsets.zero,
                        height: MediaQuery.of(context).size.width * 0.5,
                        width: MediaQuery.of(context).size.width,
                        child: Container(
                            height: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(widget.imgProfile),
                                fit: BoxFit.fitWidth,
                              ),
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ElevatedButton(
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
                  ),
                  const Text(
                    "Collections",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Saira Condensed",
                      fontSize: 25,
                    ),
                  ),
                  ContentBuilder(
                    // future: _getContentsFromUsers(widget.userId),
                    future:
                        contentCreatorVM.getContentsFromUsers(widget.userId),
                    onEdit: (value) {
                      {
                        Navigator.of(context)
                            .push(
                              MaterialPageRoute(
                                builder: (_) => const ContentForm(),
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
