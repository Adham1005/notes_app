import 'package:flutter/cupertino.dart';
import 'package:notes_app/Widgets/text_form_field.dart';

class EditNotesWidget extends StatelessWidget {
  const EditNotesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 30),
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
        ],
      ),
    );
  }
}
