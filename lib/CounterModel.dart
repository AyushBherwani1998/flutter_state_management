import 'package:flutter_state_management/Counter.dart';
import 'package:scoped_model/scoped_model.dart';

class CounterModel extends Model {
  Counter counter = Counter(count: 0);

  int get count => counter.count;

  void increment() {
    counter.increment();
    notifyListeners();
  }
}
