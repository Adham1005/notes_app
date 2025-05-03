import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Cubits/note/note_cubit.dart';
import 'package:notes_app/Models/note_model.dart';
import 'package:notes_app/Widgets/notes_bottomsheet_item.dart';
import 'package:notes_app/Widgets/notes_item_card.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '  Notes',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 25.0),
              child: Card(
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    size: 28,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: NotesListVIew(),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) {
                    return NotesBottomSheetItem();
                  });
            },
            backgroundColor: Colors.white,
            shape: CircleBorder(),
            child: Icon(
              Icons.add,
              color: Colors.black,
              size: 28,
            ),
          ),
        ),
      ),
    );
  }
}

class NotesListVIew extends StatelessWidget {
  const NotesListVIew({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteCubit, NoteState>(
      builder: (context, state) {
        BlocProvider.of<NoteCubit>(context).fetchAllNotes();
        List<NoteModel> notes = BlocProvider.of<NoteCubit>(context).notes ?? [];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return NotesItem();
            },
            itemCount: notes.length,
          ),
        );
      },
    );
  }
}
