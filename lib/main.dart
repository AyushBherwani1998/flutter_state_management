import 'package:flutter/material.dart';
import 'package:flutter_state_management/CounterModel.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(ScopedModel<CounterModel>(
      model: CounterModel(),
      child: MaterialApp(
        home: MyApp(),
      ),
    ));

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

class FirstClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: ScopedModelDescendant<CounterModel>(
          builder: (context, _, model) {
            return Text(model.count.toString());
          },
        ));
  }
}

class SecondClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        child: ScopedModelDescendant<CounterModel>(
          builder: (context, _, model) {
            return Text(model.count.toString());
          },
        ),
      ),
    );
  }
}

class ThirdClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Debug 1");
    return Scaffold(
      floatingActionButton: ScopedModelDescendant<CounterModel>(
        rebuildOnChange: false,
        builder: (context, _, model) {
          print("Debug 2");
          return FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => model.increment(),
          );
        },
      ),
      appBar: AppBar(
        title: Text("Third Class"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: ScopedModelDescendant<CounterModel>(
          builder: (context, _, model) {
            print("Debug 3");
            return Text(model.count.toString());
          },
        ),
      ),
    );
  }
}
