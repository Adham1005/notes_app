import 'package:flutter/material.dart';
import 'package:notes_app/Models/note_model.dart';
import 'package:notes_app/Widgets/edit_notes_widget.dart';

class EditNotesView extends StatelessWidget {
  final NoteModel note;
  const EditNotesView({super.key, required this.note});

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
      ),
      body: EditNotesWidget(
        note: note,
      ),
    );
  }
}
