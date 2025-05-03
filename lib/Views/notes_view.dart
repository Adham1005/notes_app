import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/Cubits/note/note_cubit.dart';
import 'package:notes_app/Widgets/news_list_view.dart';
import 'package:notes_app/Widgets/notes_bottomsheet_item.dart';

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
