import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Cubits/Add_note/add_note_cubit.dart';
import 'package:notes_app/Widgets/add_note_form.dart';

class NotesBottomSheetItem extends StatelessWidget {
  const NotesBottomSheetItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
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
                return AbsorbPointer(
                  absorbing: true,
                );
              }
              return Padding(
                padding: EdgeInsets.only(
                  left: 4,
                  right: 4,
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: AddNoteForm(),
              );
            },
          ),
        ),
      ),
    );
  }
}
