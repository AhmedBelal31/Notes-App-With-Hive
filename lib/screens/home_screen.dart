import 'package:flutter/material.dart';
import 'package:notes_app_with_hive/widgets/custom_notes_list_view.dart';
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
              isScrollControlled: true, // Set to true to enable full-height sheet
              showDragHandle: true,
              context: context,
              builder: (context) => Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height/2,
                    child: Column(
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                hintText: '  Title',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                )

                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: TextFormField(
                                decoration: InputDecoration(
                                    contentPadding:const EdgeInsets.symmetric(vertical: 60.0),
                                    hintText: '  Content',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16.0),
                                    )

                                ),
                              ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: FilledButton(
                                onPressed: () {},
                                child: Text('Add'),
                              ),
                            ),
                          ],
                        ),
                  ),
                ),
              ));
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
