import 'package:flutter/material.dart';
import 'package:notes_app_with_hive/features/add_read_notes/data/models/note_model.dart';
import '../../../../core/utils/constant.dart';
import 'edit_notes_color_item.dart';

class EditNotesColorsList extends StatefulWidget {
  const EditNotesColorsList({super.key, required this.note});

  final NoteModel note;

  @override
  State<EditNotesColorsList> createState() => _EditNotesColorsListState();
}

class _EditNotesColorsListState extends State<EditNotesColorsList> {
  late int currentIndex ;

  @override
  void initState() {
   currentIndex = kColors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            currentIndex = index;
            widget.note.color = kColors[index].value;
            setState(() {});
          },
          child: EditNoteColorItem(
            isActive: currentIndex == index,
            color: kColors[index],
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: kColors.length,
      ),
    );
  }
}
