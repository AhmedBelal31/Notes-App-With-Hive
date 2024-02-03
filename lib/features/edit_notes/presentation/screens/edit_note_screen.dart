import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_with_hive/features/add_read_notes/data/models/note_model.dart';
import 'package:notes_app_with_hive/features/add_read_notes/presentation/controller/read_notes_cubit/read_notes_cubit.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../widgets/edit_notes_colors_list.dart';

class EditNoteScreen extends StatelessWidget {
  const EditNoteScreen({super.key, required this.note});

  static const screenRoute = 'EditNoteScreen';
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    String? title, content;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomAppBar(
              title: 'Edit Note',
              icon: Icons.check,
              onPressed: () {
                note.title = title ?? note.title;
                note.subTitle = content ?? note.subTitle;
                note.save();
                BlocProvider.of<ReadNotesCubit>(context).getAllNotes();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Done ✔️'),
                    duration: Duration(seconds: 5),
                  ),
                );
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 50),
            CustomTextFormField(
              label: 'New Title',
              onChanged: (value) {
                title = value;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: CustomTextFormField(
                label: 'ُEdit Content',
                onChanged: (value) {
                  content = value;
                },
                maxLine: 5,
              ),
            ),
            const SizedBox(height: 30),
            EditNotesColorsList(note: note),
          ],
        ),
      ),
    );
  }
}
