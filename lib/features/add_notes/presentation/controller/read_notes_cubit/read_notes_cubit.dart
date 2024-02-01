import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app_with_hive/core/utils/constant.dart';
import 'package:notes_app_with_hive/features/add_notes/data/models/note_model.dart';
import 'read_notes_states.dart';

class ReadNotesCubit extends Cubit<ReadNotesStates> {
  ReadNotesCubit() : super(InitialState());

  void getAllNotes() {
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      List<NoteModel> notes = notesBox.values.toList();
      emit(ReadNotesSuccessState(notes: notes));
    } catch (error) {
      emit(ReadNotesFailureState(error: error.toString()));
    }
  }
}
