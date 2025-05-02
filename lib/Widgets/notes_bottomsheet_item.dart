import 'package:flutter/material.dart';
import 'package:notes_app/Widgets/text_form_field.dart';

class NotesBottomSheetItem extends StatelessWidget {
  const NotesBottomSheetItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomTextFormField(labelText: 'Title'),
          SizedBox(
            height: 30,
          ),
          CustomTextFormField(
            labelText: 'Content',
            maxLines: 5,
          ),
          // SizedBox(
          //   height: 100,
          // ),
          // CustomButton(icon: Icons.add, text: 'Add', onPressed: () {}),
        ],
      ),
    );
  }
}
