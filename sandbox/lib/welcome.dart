import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  final VoidCallback _startHandler;

  Welcome(this._startHandler);

  @override
  Widget build(BuildContext context) {
    /*
    return Center(child: Card(child: FractionallySizedBox(
      child: Column(children: [
        Container(padding: EdgeInsets)
        Text('hello one'),
        Text('hello two'),
      ]),
      widthFactor: 0.7,
      heightFactor: 0.5,
    ),
    shadowColor: Colors.blue,
    elevation: 10));
    */
    return Center(child: Container(child: Card(child: Column(
      children: [
        Container(child: Text('War-O Flutter',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  padding: EdgeInsets.all(50)),
        Flexible(child: FractionallySizedBox(child: FloatingActionButton(
                  onPressed: _startHandler,
                  tooltip: 'Start',
                  child: Icon(Icons.add),
                ),
                widthFactor: 0.8, heightFactor: 0.1,),
                )
      ],
    ),
      shadowColor: Colors.blue,
      elevation: 20,
    ),
    padding: EdgeInsets.all(50)));
  }
}
