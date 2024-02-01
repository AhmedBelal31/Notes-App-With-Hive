import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

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
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                } else {
                  autoValidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
              child: const Text(
                'Add',
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
