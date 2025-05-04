import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 40,
          );
        },
        itemCount: 4,
      ),
    );
  }
}
