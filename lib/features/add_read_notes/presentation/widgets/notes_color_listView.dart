import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/constant.dart';
import '../controller/add_notes_cubit/add_notes_cubit.dart';
import 'note_color_item.dart';

class NotesColorListView extends StatefulWidget {
  const NotesColorListView({super.key});

  @override
  State<NotesColorListView> createState() => _NotesColorListViewState();
}

class _NotesColorListViewState extends State<NotesColorListView> {
  int currentIndex =2;

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
            BlocProvider.of<NotesCubit>(context).color = kColors[currentIndex];
            setState(() {});
          },
          child: NoteColorItem(
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
