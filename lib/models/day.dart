import 'exercise.dart';

class Day {
    String name;
    final List<Exercise> exercises = [];

    Day(this.name);

    void addExercise(Exercise exercise) {
        if (!exercises.contains(exercise)) {
            exercises.add(exercise);
            exercise.day = this; // update exercise’s day reference
        }
    }

    void removeExercise(Exercise exercise) {
        if (exercises.remove(exercise)) {
            exercise.day = null; // clear the exercise’s day reference
        }
    }

    List<String> get exerciseNames => exercises.map((e) => e.name).toList();
}
