import 'package:flutter/material.dart';
import 'package:notes_app/Widgets/edit_notes_widget.dart';

class EditNotesView extends StatelessWidget {
  const EditNotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          ' Edit Note',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: Card(
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.check,
                  size: 28,
                ),
              ),
            ),
          ),
        ],
      ),
      body: EditNotesWidget(),
    );
  }
}
