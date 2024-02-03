import 'package:flutter/material.dart';

class NoteColorItem extends StatelessWidget {
  const NoteColorItem(
      {super.key, required this.isActive, this.color = Colors.green});

  final bool isActive;

  final Color color;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            radius: 38,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              backgroundColor: color,
              radius: 34,
            ),
          )
        : CircleAvatar(
            backgroundColor: color,
            radius: 38,
          );
  }
}
