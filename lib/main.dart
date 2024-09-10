import 'package:eric_notes_app/screens/home_screens.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Eric Notes App",
        theme:
            ThemeData(primarySwatch: Colors.blue, brightness: Brightness.dark),
        home: const HomeScreens());
  }
}
