import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_with_hive/features/add_read_notes/presentation/controller/read_notes_cubit/read_notes_cubit.dart';
import 'package:notes_app_with_hive/features/add_read_notes/presentation/controller/read_notes_cubit/read_notes_states.dart';
import '../../data/models/note_model.dart';
import 'custom_note_item.dart';

class CustomNotesListView extends StatelessWidget {
  const CustomNotesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadNotesCubit, ReadNotesStates>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<ReadNotesCubit>(context).notes ;
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => notes.isEmpty
              ? buildNoNotes()
              : CustomNoteItem(
                  note: notes[index],
                ),
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemCount: notes.length,
        );
      },
    );
  }

  Widget buildNoNotes() => const Center(
        child: Text('There Is No Notes For Now '),
      );
}
