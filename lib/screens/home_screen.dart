import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
           const  SizedBox(height: 50),
            CustomAppBar(),
          ],
        ),
      ),
    );
  }
}


