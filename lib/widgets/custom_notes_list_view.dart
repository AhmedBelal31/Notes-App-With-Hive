import 'package:flutter/material.dart';
import 'custom_note_item.dart';

class CustomNotesListView extends StatelessWidget {
  const CustomNotesListView({super.key , required this.noteColor});
final List<Color> noteColor ;
  @override
  Widget build(BuildContext context) {
    return  ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => CustomNoteItem(noteColor: noteColor[index]),
      separatorBuilder: (context, index) =>
      const SizedBox(height: 10),
      itemCount:noteColor.length,
    );
  }
}
