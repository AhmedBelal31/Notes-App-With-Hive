import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app_with_hive/features/add_read_notes/data/models/note_model.dart';
import 'package:notes_app_with_hive/features/add_read_notes/presentation/controller/add_notes_cubit/add_notes_cubit.dart';
import 'package:notes_app_with_hive/features/add_read_notes/presentation/controller/add_notes_cubit/add_notes_states.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import 'custom_indicator.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}
class _AddNoteFormState extends State<AddNoteForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        children: [
          CustomTextFormField(
            hint: 'Title',
            onSaved: (value) {
              title = value;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: CustomTextFormField(
              hint: 'Content',
              onSaved: (value) {
                content = value;
              },
              maxLine: 5,
              // onSaved:(){},
            ),
          ),
          BlocBuilder<NotesCubit, NotesStates>(
            builder: (context, state) {
              return SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () {
                    buildAddButtonAction(context);
                  },
                  child: state is AddNoteLoadingState
                      ? const CustomIndicator()
                      : const Text(
                          'Add',
                        ),
                ),
              );
            },
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  void buildAddButtonAction(BuildContext context) {
    var date = DateTime.now();
    var formattedDate = DateFormat.yMEd().format(date);
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      NoteModel note = NoteModel(
        title: title.toString(),
        subTitle: content.toString(),
        date: formattedDate,
        color: Colors.green.value,
      );
      BlocProvider.of<NotesCubit>(context).addNote(note);
    } else {
      autoValidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}
