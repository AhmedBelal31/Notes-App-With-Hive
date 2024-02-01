import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app_with_hive/data/models/note_model.dart';
import 'package:notes_app_with_hive/presentation/screens/edit_note_screen.dart';
import 'constant.dart';
import 'presentation/screens/home_screen.dart';
import 'theme.dart';


void main()  async{
  await Hive.initFlutter();
  await Hive.openBox<NoteModel>(kNotesBox);
  runApp(const NotesApp());

}
class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes App',
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes:{
        '/' : (context) => const HomeScreen() ,
        EditNoteScreen.screenRoute : (context) => const EditNoteScreen() ,
      },
    );
  }
}
