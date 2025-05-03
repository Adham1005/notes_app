import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Cubits/Add_note/add_note_cubit.dart';
import 'package:notes_app/Widgets/add_note_form.dart';

class NotesBottomSheetItem extends StatelessWidget {
  const NotesBottomSheetItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 40),
      child: SingleChildScrollView(
        child: BlocConsumer<AddNoteCubit, AddNoteState>(
          listener: (context, state) {
            if (state is AddNoteSuccess) {
              Navigator.pop(context);
            }
            if (state is AddNoteFailure) {
              print('Failed ${state.errorMessage}');
            }
          },
          builder: (context, state) {
            if (state is AddNoteLoading) {
              return CircularProgressIndicator();
            }
            return AddNoteForm();
          },
        ),
      ),
    );
  }
}
