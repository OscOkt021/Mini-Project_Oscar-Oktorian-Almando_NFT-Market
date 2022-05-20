// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:mini_project_nft_market/presentation/dashboard_page/dashboard_page.dart';

class CategorySelector extends StatelessWidget {
  const CategorySelector({
    Key? key,
    required this.content,
    required this.selectedIndex,
    required this.onChanged,
  }) : super(key: key);
  final List<String> content;
  final int selectedIndex;
  final Function(int, String) onChanged;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: content.length,
      itemBuilder: (context, index) {
        return Row(
          children: [
            GestureDetector(
              onTap: () => onChanged(index, content[index]),
              child: Container(
                height: 40.0,
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                margin: const EdgeInsets.only(right: 12.0, left: 12.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: selectedIndex == index ? Colors.blue : Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(
                    width: 3.0,
                    color: selectedIndex == index ? Colors.blue : Colors.white,
                  ),
                ),
                child: Text(
                  content[index],
                  style: TextStyle(
                    color: selectedIndex == index ? Colors.white : Colors.blue,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        );
      },
    );
  }
}
