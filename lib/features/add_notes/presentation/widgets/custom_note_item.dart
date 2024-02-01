import 'package:flutter/material.dart';

import '../../../edit_notes/presentation/edit_note_screen.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({super.key, required this.noteColor});

  final Color noteColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(EditNoteScreen.screenRoute);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          decoration: BoxDecoration(
            color: noteColor,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                title: const Text(
                  'Flutter Tips ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
                subtitle: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    'Build Your Career With xDeveloper ',
                    style: TextStyle(
                      fontSize: 20,
                      // color: Colors.black.withOpacity(.4),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 12),
                child: Text(
                  'May 21 , 2024',
                  style: TextStyle(
                      // color: Colors.black.withOpacity(0.4),
                      ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
