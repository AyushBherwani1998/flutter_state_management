import 'package:flutter/material.dart';
import 'package:flutter_state_management/Counter.dart';


void main() => runApp(MaterialApp(
  home: MyApp(),
));

class MyApp extends StatelessWidget {
  final counter = Counter(count: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("State Management"),
      ),
      body: FirstClass(count: counter,),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SecondClass(count: counter,)));
        },
        child: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}

class FirstClass extends StatefulWidget {
  final count;
  FirstClass({this.count});
  @override
  _FirstClassState createState() => _FirstClassState();
}

class _FirstClassState extends State<FirstClass> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(widget.count.count.toString()),
    );
  }
}

class SecondClass extends StatefulWidget {
  final count;
  SecondClass({this.count});
  @override
  _SecondClassState createState() => _SecondClassState();
}

class _SecondClassState extends State<SecondClass> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => ThirdClass(count: widget.count,))),
        child: Icon(Icons.forward),
      ),
      appBar: AppBar(
        title: Text("Second Class"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text(widget.count.count.toString()),
      ),
    );
  }
}

class ThirdClass extends StatefulWidget {
  final count;
  ThirdClass({this.count});
  @override
  _ThirdClassState createState() => _ThirdClassState();
}

class _ThirdClassState extends State<ThirdClass> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(()=>widget.count.increment()),
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("Third Class"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text(widget.count.count.toString()),
      ),
    );
  }
}
