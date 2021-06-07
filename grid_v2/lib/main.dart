import 'package:flutter/material.dart';

import './models/card.dart' as waro_c;
import './models/deck.dart';
import './widgets/hand.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grid 2.0',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Grid 2.0'),
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
  List<waro_c.Card> _cards = [];
  final Deck _deck = Deck(20);

  void _incrementCounter() {
    setState(() {
      _counter++;
      _deck.shuffle();
      _cards = _deck.cards;
    });
  }

  void _selectCard(waro_c.Card c) {
    print('user pressed $c');
  }

  @override
  Widget build(BuildContext context) {
    _cards = _deck.cards;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hand(_cards, _selectCard),
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
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
