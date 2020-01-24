import 'package:flutter/material.dart';
import 'package:flutter_state_management/Counter.dart';

class CounterProvider extends InheritedWidget {
  final Counter counter;

  CounterProvider({this.counter, Widget child}) : super(child: child);

  static CounterProvider of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<CounterProvider>();
  }

  @override
  bool updateShouldNotify(CounterProvider oldWidget) => true;
}
