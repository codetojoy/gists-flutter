import 'package:flutter/material.dart';

import './models/api_strategy.dart';
import './models/person.dart';
import './widgets/selection.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Players Fetcher',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Players Fetcher'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _buttonPressHandler() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    Future<Result> future = new ApiStrategy().getPlayers();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SelectionWidget(future),
            Text(
              'Button count:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _buttonPressHandler,
        tooltip: 'fetch',
        child: Icon(Icons.add),
      ),
    );
  }
}
