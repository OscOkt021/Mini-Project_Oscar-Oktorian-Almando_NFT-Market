import 'package:flutter/material.dart';
import 'package:mini_project_nft_market/models/content.dart';
import 'package:mini_project_nft_market/models/creator.dart';
import 'package:mini_project_nft_market/services/sql/nft_sql.dart';
import 'package:mini_project_nft_market/widgets/creator_selector.dart';
import 'package:mini_project_nft_market/widgets/gradient_icon.dart';

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
  String category = "music";
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

  final gradient = const LinearGradient(
    colors: <Color>[
      Colors.purple,
      Colors.pink,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

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
    final categories = category;
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
                dateCreated: DateTime.now(),
                category: categories,
              ),
            )
          : await _databaseService.updateContent(
              Content(
                title: title,
                imgUrl: imgUrl,
                description: description,
                price: price,
                creatorId: creators.id!,
                dateCreated: DateTime.now(),
                category: categories,
              ),
            );

      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Kolom Masih Kosong")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GradientText(
          "New Content",
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
                    controller: _titleController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'Enter title',
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
                    controller: _descriptionController,
                    style: const TextStyle(color: Colors.white),
                    maxLines: 7,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'Describe this content',
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
                  TextField(
                    controller: _imgUrlController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'Enter image url',
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
                    keyboardType: TextInputType.number,
                    controller: _priceController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'Enter price',
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
                  FutureBuilder<List<Creator>>(
                    future: _getCreators(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Text(
                          "Loading creators...",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        );
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
                  Container(
                    padding: const EdgeInsets.all(9),
                    child: Column(
                      children: [
                        const Text(
                          "Category",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        DropdownButton<String>(
                          value: category,
                          icon: const Icon(
                            Icons.arrow_circle_down,
                            color: Colors.white,
                          ),
                          elevation: 16,
                          style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                          ),
                          underline: Container(
                            height: 2,
                            color: Colors.white,
                          ),
                          onChanged: (value) {
                            setState(() {
                              category = value!;
                            });
                          },
                          items: <String>[
                            'music',
                            'aesthetic',
                            'art',
                            '3d',
                            'invest',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(
                                  color: Colors.blue,
                                  fontFamily: "Saira Condensed",
                                ),
                              ),
                            );
                          }).toList(),
                        )
                      ],
                    ),
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
        ],
      ),
    );
  }
}
