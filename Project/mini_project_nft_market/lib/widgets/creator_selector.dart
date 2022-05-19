import 'package:flutter/material.dart';

class CreatorSelector extends StatelessWidget {
  const CreatorSelector({
    Key? key,
    required this.creators,
    required this.selectedIndex,
    required this.onChanged,
  }) : super(key: key);
  final List<String> creators;
  final int selectedIndex;
  final Function(int) onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select Creator',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 12.0),
        SizedBox(
          height: 40.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: creators.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => onChanged(index),
                child: Container(
                  height: 40.0,
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  margin: const EdgeInsets.only(right: 12.0, left: 12.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      width: 3.0,
                      color:
                          selectedIndex == index ? Colors.teal : Colors.white,
                    ),
                  ),
                  child: Text(
                    creators[index],
                    style: TextStyle(
                      color:
                          selectedIndex == index ? Colors.teal : Colors.white,
                      fontFamily: "Saira Condensed",
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
