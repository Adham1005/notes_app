import 'package:flutter/material.dart';
import 'package:notes_app/Models/note_model.dart';
import 'package:notes_app/Widgets/custom_button.dart';
import 'package:notes_app/Widgets/text_form_field.dart';

class EditNotesWidget extends StatefulWidget {
  final NoteModel note;

  const EditNotesWidget({super.key, required this.note});

  @override
  State<EditNotesWidget> createState() => _EditNotesWidgetState();
}

class _EditNotesWidgetState extends State<EditNotesWidget> {
  String? title;

  String? subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 30),
      child: Column(
        children: [
          CustomTextFormField(
            hintText: 'Title',
            onChanged: (value) {
              value = title;
            },
          ),
          SizedBox(
            height: 30,
          ),
          CustomTextFormField(
            onChanged: (value) {
              value = subTitle;
            },
            hintText: 'Content',
            maxLines: 5,
          ),
          SizedBox(
            height: 30,
          ),
          CustomButton(
            text: 'Edit',
            color: Colors.teal,
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.subTitle = subTitle ?? widget.note.subTitle;
              widget.note.save();
            },
          ),
        ],
      ),
    );
  }
}
