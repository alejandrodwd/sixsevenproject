import 'package:flutter/material.dart';
import 'list_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo App',
      debugShowCheckedModeBanner: false, // removes the debug banner
      theme: ThemeData(
        primarySwatch: Colors.teal, // optional: sets app color
      ),
      home: const ListScreen(), // <-- show your ListScreen
    );
  }
}
