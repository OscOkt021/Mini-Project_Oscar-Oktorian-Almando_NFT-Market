import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mini_project_nft_market/models/content.dart';
import 'package:mini_project_nft_market/models/creator.dart';
import 'package:mini_project_nft_market/presentation/creator/creator_form.dart';
import 'package:mini_project_nft_market/presentation/details/content_form.dart';
import 'package:mini_project_nft_market/services/sql/nft_sql.dart';
import 'package:mini_project_nft_market/widgets/content_builder.dart';
import 'package:mini_project_nft_market/widgets/creator_builder.dart';

class HomeJustTest extends StatefulWidget {
  const HomeJustTest({Key? key}) : super(key: key);

  @override
  State<HomeJustTest> createState() => _HomeJustTestState();
}

class _HomeJustTestState extends State<HomeJustTest> {
  final DatabaseService _databaseService = DatabaseService();

  Future<List<Content>> _getContents() async {
    return await _databaseService.content();
  }

  Future<List<Creator>> _getCreators() async {
    return await _databaseService.creators();
  }

  Future<void> _onContentDelete(Content content) async {
    await _databaseService.deleteContent(content.id!);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('NFT'),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text('Content'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text('Creator'),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ContentBuilder(
              future: _getContents(),
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
            CreatorBuilder(
              future: _getCreators(),
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
                        builder: (_) => CreatorForm(),
                        fullscreenDialog: true,
                      ),
                    )
                    .then((_) => setState(() {}));
              },
              heroTag: 'add Creator',
              child: FaIcon(FontAwesomeIcons.userPlus),
            ),
            SizedBox(height: 12.0),
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
              heroTag: 'add Content',
              child: FaIcon(FontAwesomeIcons.plus),
            ),
          ],
        ),
      ),
    );
  }
}
