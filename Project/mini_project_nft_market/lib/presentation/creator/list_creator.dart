import 'package:flutter/material.dart';
import 'package:mini_project_nft_market/models/creator.dart';
import 'package:mini_project_nft_market/services/sql/nft_sql.dart';
import 'package:mini_project_nft_market/widgets/creator_builder.dart';

class ListCreator extends StatefulWidget {
  const ListCreator({Key? key}) : super(key: key);

  @override
  State<ListCreator> createState() => _ListCreatorState();
}

class _ListCreatorState extends State<ListCreator> {
  final DatabaseService _databaseService = DatabaseService();

  Future<List<Creator>> _getCreators() async {
    return await _databaseService.creators();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Find Your Favourite Creator!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontFamily: "Saira Condensed",
            ),
          ),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/bg/bg1.jpg'),
                    fit: BoxFit.fill)),
          ),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image(
              image: AssetImage("assets/images/bg/bg1.jpg"),
              fit: BoxFit.cover,
            ),
            CreatorBuilder(
              future: _getCreators(),
            ),
          ],
        ),
      ),
    );
  }
}
