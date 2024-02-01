import '../../../data/models/note_model.dart';

abstract class NotesStates {}

class InitialState extends NotesStates {}

class AddNoteLoadingState extends NotesStates {}

class  AddNoteSuccessState extends NotesStates {}

class  AddNoteFailureState extends NotesStates {
  final String error ;
  AddNoteFailureState({required this.error});
}




class ReadNotesLoadingState extends NotesStates {}

class  ReadNotesSuccessState extends NotesStates
{
  List<NoteModel> notes ;
  ReadNotesSuccessState({required this.notes}) ;
}

class  ReadNotesFailureState extends NotesStates {
  final String error ;
  ReadNotesFailureState({required this.error});
}