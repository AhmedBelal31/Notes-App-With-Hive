

import 'package:bloc/bloc.dart';

import 'add_notes_states.dart';

class NotesCubit extends Cubit<NotesStates>

{
  NotesCubit():super(InitialState());
}