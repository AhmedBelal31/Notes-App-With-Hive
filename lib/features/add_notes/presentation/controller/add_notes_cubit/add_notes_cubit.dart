import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app_with_hive/core/utils/constant.dart';
import 'package:notes_app_with_hive/features/add_notes/data/models/note_model.dart';
import 'add_notes_states.dart';

class NotesCubit extends Cubit<NotesStates> {
  NotesCubit() : super(InitialState());

  void addNote(NoteModel note) async {
    emit(AddNoteLoadingState());
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      await notesBox.add(note);
      emit(AddNoteSuccessState());
    } catch (error) {
      emit(AddNoteFailureState(error: error.toString()));
    }
  }
}
