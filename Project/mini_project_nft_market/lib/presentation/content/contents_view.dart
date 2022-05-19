import 'package:flutter/material.dart';
import 'package:mini_project_nft_market/models/content.dart';
import 'package:mini_project_nft_market/presentation/ViewModel/content_creator_view_model.dart';
// ignore: unused_import
import 'package:mini_project_nft_market/presentation/dashboard_page/dashboard_page.dart';
import 'package:mini_project_nft_market/presentation/content/content_form.dart';
import 'package:mini_project_nft_market/services/sql/nft_sql.dart';
import 'package:mini_project_nft_market/widgets/category_selector.dart';
import 'package:mini_project_nft_market/widgets/content_builder.dart';
import 'package:mini_project_nft_market/widgets/gradient_icon.dart';

class ItemView extends StatefulWidget {
  const ItemView({Key? key}) : super(key: key);

  @override
  State<ItemView> createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  final ContentCreatorVM contentCreatorVM = ContentCreatorVM();
  final DatabaseService _databaseService = DatabaseService();

  Future<void> _onContentDelete(Content content) async {
    await _databaseService.deleteContent(content.id!);
    setState(() {});
  }

  static final List<Content> _contents = [];

  int _selectedContent = 0;

  Future<List<Content>> _getContents() async {
    final contents = await _databaseService.contentByCategory();
    if (_contents.isEmpty) _contents.addAll(contents);

    return _contents;
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
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
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
                    ],
                  ),
                  const Center(
                    child: GradientText("Explore It!",
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
                  // SingleChildScrollView(
                  //   scrollDirection: Axis.horizontal,
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     children: [
                  // Badge(
                  //   icon: Icons.circle,
                  //   color: Colors.blue,
                  //   text: "All",
                  // ),
                  //       // SizedBox(
                  //       //   width: 10,
                  //       // ),
                  //       // Badge(
                  //       //   icon: Icons.music_note,
                  //       //   text: "Music",
                  //       // ),
                  //       // SizedBox(
                  //       //   width: 10,
                  //       // ),
                  //       // Badge(
                  //       //   icon: Icons.camera,
                  //       //   text: "Aestethic",
                  //       // ),
                  //       // SizedBox(
                  //       //   width: 10,
                  //       // ),
                  //       // Badge(
                  //       //   icon: Icons.brush,
                  //       //   text: "Art",
                  //       // ),
                  //       // SizedBox(
                  //       //   width: 10,
                  //       // ),
                  //       // Badge(
                  //       //   icon: Icons.person,
                  //       //   text: "3D",
                  //       // ),
                  //       // SizedBox(
                  //       //   width: 10,
                  //       // ),
                  //       // Badge(
                  //       //   icon: Icons.money,
                  //       //   text: "Invest",
                  //       // ),

                  //     ],
                  //   ),
                  // ),
                  SizedBox(
                    height: 50,
                    child: FutureBuilder<List<Content>>(
                      future: _getContents(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Text(
                            "Loading categories",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          );
                        }
                        return CategorySelector(
                          content: _contents.map((e) => e.category).toList(),
                          selectedIndex: _selectedContent,
                          onChanged: (value) {
                            setState(() {
                              _selectedContent = value;
                            });
                          },
                        );
                      },
                    ),
                  ),
                  ContentBuilder(
                    // future: _getContents(),
                    future: contentCreatorVM.getContents(),
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
