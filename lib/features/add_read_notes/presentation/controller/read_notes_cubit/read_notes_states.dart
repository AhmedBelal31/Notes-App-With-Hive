import '../../../data/models/note_model.dart';

abstract class ReadNotesStates {}

class InitialState extends ReadNotesStates {}



class ReadNotesSuccessState extends ReadNotesStates {
  List<NoteModel> notes;

  ReadNotesSuccessState({required this.notes});
}

