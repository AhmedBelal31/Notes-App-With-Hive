import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_with_hive/features/add_read_notes/data/models/note_model.dart';
import 'package:notes_app_with_hive/features/add_read_notes/presentation/controller/read_notes_cubit/read_notes_cubit.dart';
import '../../../edit_notes/presentation/edit_note_screen.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(EditNoteScreen.screenRoute);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: Text(
                  note.title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: ()
                  {
                    note.delete();
                    BlocProvider.of<ReadNotesCubit>(context).getAllNotes();
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    note.subTitle,
                    style: const TextStyle(
                      fontSize: 20,
                      // color: Colors.black.withOpacity(.4),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Text(
                  note.date,
                  style: const TextStyle(
                      // color: Colors.black.withOpacity(0.4),
                      ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
