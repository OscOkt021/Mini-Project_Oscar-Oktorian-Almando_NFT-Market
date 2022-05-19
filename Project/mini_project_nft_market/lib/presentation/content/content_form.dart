import 'package:flutter/material.dart';
import 'package:mini_project_nft_market/models/content.dart';
import 'package:mini_project_nft_market/models/creator.dart';
import 'package:mini_project_nft_market/services/sql/nft_sql.dart';
import 'package:mini_project_nft_market/widgets/creator_selector.dart';

class ContentForm extends StatefulWidget {
  const ContentForm({Key? key, this.content}) : super(key: key);
  final Content? content;
  @override
  State<ContentForm> createState() => _ContentFormState();
}

class _ContentFormState extends State<ContentForm> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _imgUrlController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  static final List<Creator> _creators = [];

  final DatabaseService _databaseService = DatabaseService();

  int _selectedCreator = 0;

  @override
  void initState() {
    super.initState();
    if (widget.content != null) {
      _titleController.text = widget.content!.title;
      _imgUrlController.text = widget.content!.imgUrl;
      _descriptionController.text = widget.content!.description;
      _priceController.text = widget.content!.price.toString();
    }
  }

  Future<List<Creator>> _getCreators() async {
    final creators = await _databaseService.creators();
    if (_creators.isEmpty) _creators.addAll(creators);
    if (widget.content != null) {
      _selectedCreator =
          _creators.indexWhere((e) => e.id == widget.content!.creatorId);
    }
    return _creators;
  }

  Future<void> _onSave() async {
    final title = _titleController.text;
    final imgUrl = _imgUrlController.text;
    final description = _descriptionController.text;
    final price = double.parse(_priceController.text);
    final creators = _creators[_selectedCreator];
    // Add save code here

    if (title != "" && imgUrl != "" && description != "") {
      widget.content == null
          ? await _databaseService.insertContent(
              Content(
                  title: title,
                  imgUrl: imgUrl,
                  description: description,
                  price: price,
                  creatorId: creators.id!,
                  dateCreated: DateTime.now()),
            )
          : await _databaseService.updateContent(
              Content(
                  title: title,
                  imgUrl: imgUrl,
                  description: description,
                  price: price,
                  creatorId: creators.id!,
                  dateCreated: DateTime.now()),
            );

      Navigator.pop(context);
    } else {
      // ignore: avoid_print
      print("kolom masih kosong");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Content!'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter title',
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _descriptionController,
                maxLines: 7,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Describe this content',
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _imgUrlController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter image url',
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                keyboardType: TextInputType.number,
                controller: _priceController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter price',
                ),
              ),
              const SizedBox(height: 16.0),
              FutureBuilder<List<Creator>>(
                future: _getCreators(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text("Loading creators...");
                  }
                  return CreatorSelector(
                    creators: _creators.map((e) => e.nickName).toList(),
                    selectedIndex: _selectedCreator,
                    onChanged: (value) {
                      setState(() {
                        _selectedCreator = value;
                      });
                    },
                  );
                },
              ),
              const SizedBox(height: 24.0),
              SizedBox(
                height: 45.0,
                child: ElevatedButton(
                  onPressed: _onSave,
                  child: const Text(
                    'Save the content data',
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
