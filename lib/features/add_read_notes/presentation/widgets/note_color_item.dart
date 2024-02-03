import 'package:flutter/material.dart';

class NoteColorItem extends StatelessWidget {
  const NoteColorItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: CircleAvatar(
        backgroundColor: Colors.green,
        radius: 38,
      ),
    );
  }
}
