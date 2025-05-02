import 'package:flutter/material.dart';
import 'package:notes_app/Widgets/text_form_field.dart';

import 'custom_button.dart';

class NotesBottomSheetItem extends StatelessWidget {
  const NotesBottomSheetItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 40),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextFormField(hintText: 'Title'),
            SizedBox(
              height: 30,
            ),
            CustomTextFormField(
              hintText: 'Content',
              maxLines: 5,
            ),
            SizedBox(
              height: 50,
            ),
            CustomButton(icon: Icons.add, text: 'Add', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
