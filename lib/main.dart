import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/basic_widgets_screen.dart';
import 'screens/layout_widgets_screen.dart';
import 'screens/stateful_example_screen.dart';
import 'screens/form_example_screen.dart';
import 'screens/navigation_example_screen.dart';
import 'screens/list_example_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
    );
  }
}