import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/services/bloc_observer.dart';
import 'core/utils/constant.dart';
import 'core/utils/theme.dart';
import 'features/add_notes/data/models/note_model.dart';
import 'features/add_notes/presentation/screens/home_screen.dart';
import 'features/edit_notes/presentation/edit_note_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);

  Bloc.observer = MyBlocObserver();

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes App',
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        EditNoteScreen.screenRoute: (context) => const EditNoteScreen(),
      },
    );
  }
}
