import 'package:flutter/material.dart';
import 'package:notes_app_with_hive/widgets/custom_notes_list_view.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/custom_note_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
final List<Color> noteColor =const [Colors.red , Colors.blue , Colors.orange , Colors.green];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 50),
              const CustomAppBar(),
              CustomNotesListView(noteColor: noteColor),

            ],
          ),
        ),
      ),
    );
  }
}
