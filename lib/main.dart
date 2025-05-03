import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/Cubits/bloc_observer.dart';
import 'package:notes_app/Models/note_model.dart';
import 'package:notes_app/Views/notes_view.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = CubitObserver();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox('notes_box');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes App',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          color: Colors.black,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const NotesView(),
    );
  }
}
