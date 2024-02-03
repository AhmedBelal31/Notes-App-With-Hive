import 'package:flutter/material.dart';

import 'note_color_item.dart';

class NotesColorListView extends StatelessWidget {
  const NotesColorListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => const NoteColorItem(),
        itemCount: 6,
      ),
    );
  }
}
