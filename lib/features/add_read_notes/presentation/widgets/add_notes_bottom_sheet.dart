import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app_with_hive/features/add_read_notes/presentation/controller/add_notes_cubit/add_notes_cubit.dart';
import 'package:notes_app_with_hive/features/add_read_notes/presentation/controller/add_notes_cubit/add_notes_states.dart';
import 'package:notes_app_with_hive/features/add_read_notes/presentation/controller/read_notes_cubit/read_notes_cubit.dart';
import 'add_note_form.dart';

class AddNotesBottomSheet extends StatelessWidget {
  const AddNotesBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: BlocConsumer<NotesCubit, NotesStates>(
        listener: (context, state) {
          if (state is AddNoteFailureState) {
            debugPrint('Failed .. ${state.error} ');
          }
          if (state is AddNoteSuccessState) {
            BlocProvider.of<ReadNotesCubit>(context).getAllNotes();
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: const Text('Note Added Successfully'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              elevation: 0.6,
              duration: const Duration(seconds: 3),
            ));
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteLoadingState ? true : false,
            child: Padding(
              padding: const EdgeInsets.all(10.0)
                  .copyWith(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: AddNoteForm(),
              ),
            ),
          );
        },
      ),
    );
  }
}
