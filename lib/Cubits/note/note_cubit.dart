import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/Models/note_model.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());

  fetchAllNotes() {
    try {
      var notesBox = Hive.box<NoteModel>('notes_box');

      List<NoteModel> notes = notesBox.values.toList();
      emit(NoteSuccess(note: notes));
    } catch (e) {
      emit(NoteFailure(e.toString()));
    }
  }
}
