import 'package:flutter/material.dart';
import 'package:notes_app_with_hive/widgets/custom_notes_list_view.dart';
import '../widgets/add_notes_bottom_sheet.dart';
import '../widgets/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Color> noteColor = const [
    Colors.red,
    Colors.blue,
    Colors.orange,
    Colors.green
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            isScrollControlled: true,
            showDragHandle: true,
            context: context,
            builder: (context) => AddNotesBottomSheet(),
          );
        },
        child: const Icon(Icons.add),
      ),
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


