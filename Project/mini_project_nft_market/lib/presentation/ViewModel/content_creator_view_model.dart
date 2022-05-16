import 'package:flutter/material.dart';
import 'package:mini_project_nft_market/models/content.dart';
import 'package:mini_project_nft_market/models/creator.dart';
import 'package:mini_project_nft_market/services/sql/nft_sql.dart';

class ContentCreatorVM {
  final DatabaseService _databaseService = DatabaseService();

  // ignore: unused_field
  final TextEditingController _imgController = TextEditingController();
  // ignore: unused_field
  final TextEditingController _aboutController = TextEditingController();

  Future<List<Content>> getContents() async {
    return await _databaseService.content();
  }

  Future<List<Content>> getContentsFromUsers(int id) async {
    return await _databaseService.contentWithId(id);
  }

  Future<List<Creator>> getCreators() async {
    return await _databaseService.creators();
  }
}
