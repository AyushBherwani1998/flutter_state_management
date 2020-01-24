import 'package:flutter/material.dart';
import 'package:flutter_state_management/Counter.dart';

class CounterProvider with ChangeNotifier{
  final Counter counter;

  CounterProvider({this.counter});

  void increment() {
    counter.increment();
    notifyListeners();
  }
}
