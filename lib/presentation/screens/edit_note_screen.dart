import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/custom_text_form_field.dart';

class EditNoteScreen extends StatelessWidget {
  const EditNoteScreen({super.key});
static const screenRoute = 'EditNoteScreen' ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomAppBar(
              title: 'Edit Note',
              icon: Icons.check,
            ),
            SizedBox(height: 50),
            CustomTextFormField(hint: 'Title'),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: CustomTextFormField(hint: 'Content' , maxLine: 5),
            ),
          ],
        ),
      ),
    );
  }
}
