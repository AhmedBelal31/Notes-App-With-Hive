abstract class NotesStates {}

class InitialState extends NotesStates {}

class AddNoteLoadingState extends NotesStates {}

class  AddNoteSuccessState extends NotesStates {}

class  AddNoteFailureState extends NotesStates {
  final String error ;
  AddNoteFailureState({required this.error});
}