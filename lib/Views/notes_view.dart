import 'package:flutter/material.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notes',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Card(
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  size: 28,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
