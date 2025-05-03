import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/Models/note_model.dart';
import 'package:notes_app/Views/edit_notes_view.dart';

class NotesItem extends StatelessWidget {
  final NoteModel note;

  const NotesItem({
    super.key,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditNotesView(),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 30),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        decoration: BoxDecoration(
          color: Color(note.color), // Light yellow background
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title & Delete Icon Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  note.title,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  color: Colors.transparent,
                  onPressed: () {
                    note.delete();
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.black87,
                    size: 30,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            // Description
            Padding(
              padding: const EdgeInsets.only(right: 100.0),
              child: Text(
                note.subTitle,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 2,
              ),
            ),
            SizedBox(height: 20),
            // Date
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                note.date,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.brown[900],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
