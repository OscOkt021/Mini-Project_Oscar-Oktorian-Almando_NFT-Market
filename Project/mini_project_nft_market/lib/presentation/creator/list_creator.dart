import 'package:flutter/material.dart';
import 'package:mini_project_nft_market/presentation/ViewModel/content_creator_view_model.dart';
import 'package:mini_project_nft_market/widgets/creator_builder.dart';
import 'package:mini_project_nft_market/widgets/gradient_icon.dart';

class ListCreator extends StatefulWidget {
  const ListCreator({Key? key}) : super(key: key);

  @override
  State<ListCreator> createState() => _ListCreatorState();
}

class _ListCreatorState extends State<ListCreator> {
  final ContentCreatorVM contentCreatorVM = ContentCreatorVM();

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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: GradientText(
            "Find Your Favorite Creators!",
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
            CreatorBuilder(
              future: contentCreatorVM.getCreators(),
            ),
          ],
        ),
      ),
    );
  }
}
