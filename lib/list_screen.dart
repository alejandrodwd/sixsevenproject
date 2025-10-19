import 'package:flutter/material.dart';
import 'exercise.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final Day day = Day("Monday");

  @override
  void initState() {
    super.initState();
    // add some initial exercises
    day.addExercise(Exercise("Push-ups", 0, 10, 3, day));
    day.addExercise(Exercise("Squats", 0, 15, 3, day));
    day.addExercise(Exercise("Plank", 0, 1, 3, day));
  }

  void _addExercise() {
    final newExercise =
        Exercise("Exercise ${day.exercises.length + 1}", 0, 10, 3, day);
    setState(() {
      day.addExercise(newExercise);
    });
  }

  void _removeExercise(int index) {
    setState(() {
      day.removeExercise(day.exercises[index]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(day.name),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.add), onPressed: _addExercise),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: day.exercises.length,
        itemBuilder: (context, index) {
          final exercise = day.exercises[index];
          return GestureDetector(
            onTap: () => _removeExercise(index),
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  exercise.name,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
