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
        child: AddNoteFromState(),
      ),
    );
  }
}

class AddNoteFromState extends StatefulWidget {
  const AddNoteFromState({
    super.key,
  });

  @override
  State<AddNoteFromState> createState() => _AddNoteFromStateState();
}

class _AddNoteFromStateState extends State<AddNoteFromState> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        children: [
          CustomTextFormField(
            hintText: 'Title',
            onSaved: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 30,
          ),
          CustomTextFormField(
            hintText: 'Content',
            maxLines: 5,
            onSaved: (value) {
              subTitle = value;
            },
          ),
          const SizedBox(
            height: 50,
          ),
          CustomButton(
              text: 'Add',
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                } else {
                  setState(() {
                    autoValidateMode = AutovalidateMode.always;
                  });
                }
              }),
        ],
      ),
    );
  }
}
