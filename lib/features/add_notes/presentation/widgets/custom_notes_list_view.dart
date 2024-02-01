import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_with_hive/features/add_notes/presentation/controller/read_notes_cubit/read_notes_cubit.dart';
import 'package:notes_app_with_hive/features/add_notes/presentation/controller/read_notes_cubit/read_notes_states.dart';
import 'custom_note_item.dart';

class CustomNotesListView extends StatelessWidget {
  const CustomNotesListView({super.key,});



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadNotesCubit, ReadNotesStates>(
      builder: (context, state) {
        if (state is ReadNotesSuccessState) {
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => CustomNoteItem(
              note: state.notes[index],
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: state.notes.length,
          );
        }
        else if (state is ReadNotesFailureState) {
          return Text('There is An Failure ${state.error}');
        }
        else {
          return const Center(
            child: Text('There Is No Notes For Now '),
          );
        }
      },
    );
  }
}
