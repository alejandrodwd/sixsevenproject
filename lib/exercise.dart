class Exercise {
    String name;
    int weight;
    int reps;
    int sets;
    Day? day;
    final List<Pair> log = [];
    DateTime? lastChange;  // cell will be continuously mapped w color based on days
    
    Exercise(this.name, this.weight, this.reps, this.sets, this.day);

    void changeDay(Day newDay) {
        day?.removeExercise(this);
        day = newDay;
        newDay.addExercise(this);
    }

    void updateWeight(int newWeight) {
        weight = newWeight;
        addToLog(DateTime.now(), newWeight);
        lastChange = DateTime.now();
    }

    void addToLog(DateTime date, int weight) {
        final dayOnly = DateTime(date.year, date.month, date.day);
        for (int i = 0; i < log.length; i++) {
            final entryDay = DateTime(
                log[i].first.year,
                log[i].first.month,
                log[i].first.day,
            );

            if (entryDay == dayOnly) {
                log[i] = Pair(dayOnly, weight); // overwrite existing entry
                return;
            }
        }
        log.add(Pair(dayOnly, weight));  // if no entry for date, add new one
    }
}

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

class Pair {
  final DateTime first;
  final int second;

  Pair(this.first, this.second);

  @override
  String toString() => '($first, $second)';
}
