import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/Cubits/Add_note/add_note_cubit.dart';
import 'package:notes_app/Cubits/note/note_cubit.dart';
import 'package:notes_app/Models/note_model.dart';
import 'package:notes_app/Widgets/color_item.dart';
import 'package:notes_app/Widgets/custom_button.dart';
import 'package:notes_app/Widgets/text_form_field.dart';

class AddNoteForm extends StatefulWidget {
  final bool isLoading;

  const AddNoteForm({
    super.key,
    this.isLoading = false,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
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
          ColorItem(),
          const SizedBox(
            height: 50,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                  isLoading: state is AddNoteLoading ? true : false,
                  text: 'Add',
                  onPressed: () {
                    DateTime now = DateTime.now();
                    String formattedDate = DateFormat('dd, MMMM y').format(now);
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      var noteModel = NoteModel(
                          title: title!,
                          subTitle: subTitle!,
                          date: formattedDate,
                          color: Colors.red.value);
                      BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                      BlocProvider.of<NoteCubit>(context).fetchAllNotes();
                    } else {
                      setState(() {
                        autoValidateMode = AutovalidateMode.always;
                      });
                    }
                  });
            },
          ),
        ],
      ),
    );
  }
}
