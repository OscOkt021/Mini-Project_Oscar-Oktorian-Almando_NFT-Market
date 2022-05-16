// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:mini_project_nft_market/models/creator.dart';
import 'package:mini_project_nft_market/services/sql/nft_sql.dart';

class CreatorForm extends StatefulWidget {
  const CreatorForm({Key? key}) : super(key: key);

  @override
  State<CreatorForm> createState() => _CreatorFormState();
}

class _CreatorFormState extends State<CreatorForm> {
  final TextEditingController _nickNameController = TextEditingController();
  final TextEditingController _realNameController = TextEditingController();
  final TextEditingController _imgController = TextEditingController();
  final TextEditingController _aboutController = TextEditingController();

  final DatabaseService _databaseService = DatabaseService();

  Future<void> _onSave() async {
    final nickName = _nickNameController.text;
    final realName = _realNameController.text;
    final imgUrl = _imgController.text;
    final about = _aboutController.text;

    if (nickName != "" && realName != "" && imgUrl != "" && about != "") {
      final creatorSave = Creator(
          nickName: nickName,
          realName: realName,
          imgProfile: imgUrl,
          about: about);

      await _databaseService.insertCreator(creatorSave);

      Navigator.pop(context);
    } else {
      print("kolom masih kosong");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new Creator'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _nickNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Creator Nickname',
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _realNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Creator Real Name',
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _imgController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Image Url',
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _aboutController,
                maxLines: 7,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'About Creator',
                ),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                height: 45.0,
                child: ElevatedButton(
                  onPressed: _onSave,
                  child: const Text(
                    'Save the Creator',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
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
