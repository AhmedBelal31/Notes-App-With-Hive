import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_with_hive/features/add_notes/presentation/controller/add_notes_cubit/add_notes_cubit.dart';
import 'package:notes_app_with_hive/features/add_notes/presentation/controller/add_notes_cubit/add_notes_states.dart';
import 'add_note_form.dart';

class AddNotesBottomSheet extends StatelessWidget {
  const AddNotesBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit, NotesStates>(
      listener: (context, state) {
        if(state is AddNoteLoadingState)
          {
            print('Loading State' ) ;
          }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(10.0)
              .copyWith(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: AddNoteForm(),
          ),
        );
      },
    );
  }
}
