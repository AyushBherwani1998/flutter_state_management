import 'package:flutter/material.dart';
import 'package:flutter_state_management/Counter.dart';
import 'package:flutter_state_management/CounterProvider.dart';

void main() => runApp(CounterProvider(
    child: MaterialApp(
      home: MyApp(),
    ),
    counter: Counter(count: 0)));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("State Management"),
      ),
      body: FirstClass(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SecondClass()));
        },
        child: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}

class FirstClass extends StatefulWidget {
  @override
  _FirstClassState createState() => _FirstClassState();
}

class _FirstClassState extends State<FirstClass> {
  @override
  Widget build(BuildContext context) {
    CounterProvider counterProvider =
        context.dependOnInheritedWidgetOfExactType<CounterProvider>();
    return Container(
      alignment: Alignment.center,
      child: Text(counterProvider.counter.count.toString()),
    );
  }
}

class SecondClass extends StatefulWidget {
  @override
  _SecondClassState createState() => _SecondClassState();
}

class _SecondClassState extends State<SecondClass> {
  @override
  Widget build(BuildContext context) {
    CounterProvider counterProvider =
        context.dependOnInheritedWidgetOfExactType<CounterProvider>();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => ThirdClass())),
        child: Icon(Icons.forward),
      ),
      appBar: AppBar(
        title: Text("Second Class"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text(counterProvider.counter.count.toString()),
      ),
    );
  }
}

class ThirdClass extends StatefulWidget {
  @override
  _ThirdClassState createState() => _ThirdClassState();
}

class _ThirdClassState extends State<ThirdClass> {
  @override
  Widget build(BuildContext context) {
    CounterProvider counterProvider = CounterProvider.of(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(()=>counterProvider.counter.increment()),
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("Third Class"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text(counterProvider.counter.count.toString()),
      ),
    );
  }
}