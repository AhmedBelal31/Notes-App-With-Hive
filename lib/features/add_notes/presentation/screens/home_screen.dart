import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/custom_notes_list_view.dart';
import '../widgets/add_notes_bottom_sheet.dart';

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
            builder: (context) => const AddNotesBottomSheet(),
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
              const CustomAppBar(
                title: 'Notes',
                icon: Icons.search,
              ),
              CustomNotesListView(noteColor: noteColor),
            ],
          ),
        ),
      ),
    );
  }
}
