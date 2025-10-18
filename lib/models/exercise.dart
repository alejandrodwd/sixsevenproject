import 'pair.dart';

class Exercise {
    String name;
    int weight;
    int reps;
    int sets;
    String day;
    final List<Pair> log = [];
    DateTime? lastChange;  // cell will be continuously mapped w color based on days
    
    Exercise(this.name, this.weight, this.reps, this.sets, this.day);

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




/*
main points
construct the graph from the available data points (date-weight)
months / days on the x axis
kg on the y axis
easily scalable x and y axis, y from zero to max weight + 10
x from 0 to date of last change
y from 0 to max weight + 10

class ItemList:
    def __init__(self, items=None):
        self.items = items or []

    def add(self, item):
        self.items.append(item)

    def filter(self, attr_type, value=None):
        return [item for item in self.items if item.has_attribute(attr_type, value)] 