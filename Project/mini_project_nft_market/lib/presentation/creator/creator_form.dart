// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:mini_project_nft_market/models/creator.dart';
import 'package:mini_project_nft_market/services/sql/nft_sql.dart';
import 'package:mini_project_nft_market/widgets/gradient_icon.dart';

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
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Kolom Masih Kosong")));
    }
  }

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
    return Scaffold(
      appBar: AppBar(
        title: GradientText(
          "Add a New Creator!",
          gradient: gradient,
          style: const TextStyle(
            // color: Colors.white,
            fontFamily: "Saira Condensed",
            fontSize: 28,
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bg/bg1.jpg'),
                  fit: BoxFit.fill)),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          const Image(
            image: AssetImage("assets/images/bg/bg1.jpg"),
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: _nickNameController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'Creator Nickname',
                      hintStyle: TextStyle(color: Colors.white.withOpacity(.5)),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 20),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: _realNameController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'Creator Real Name',
                      hintStyle: TextStyle(color: Colors.white.withOpacity(.5)),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 20),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: _imgController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'Image Url',
                      hintStyle: TextStyle(color: Colors.white.withOpacity(.5)),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 20),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: _aboutController,
                    maxLines: 7,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'About Creator',
                      hintStyle: TextStyle(color: Colors.white.withOpacity(.5)),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 20),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(20),
                      ),
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
        ],
      ),
    );
  }
}
