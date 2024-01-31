import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'constant.dart';
import 'presentation/screens/home_screen.dart';


void main()  async{
  await Hive.initFlutter();
  await Hive.openBox(kNotesBox);
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
     // colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
        brightness: Brightness.dark ,
        fontFamily: 'Poppins' ,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
