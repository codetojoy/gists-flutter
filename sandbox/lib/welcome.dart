import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  final VoidCallback _newGameHandler;

  Welcome(this._newGameHandler);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: FractionallySizedBox(
      child: Card(
          child: Column(children: [
            Flexible(
                child: FractionallySizedBox(
              child: Text('War-O Flutter',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              widthFactor: 0.5,
              heightFactor: 0.5,
            )),
            Flexible(
              child: FractionallySizedBox(
                child: FloatingActionButton(
                  onPressed: _newGameHandler,
                  tooltip: 'New Game',
                  child: Icon(Icons.add),
                ),
                widthFactor: 0.5,
                heightFactor: 0.5,
              ),
            ),
          ]),
          elevation: 20,
          shadowColor: Colors.blue),
      widthFactor: 0.8,
      heightFactor: 0.4,
      alignment: Alignment.center,
    ));
    /*
            Card(
              child: FractionallySizedBox(
                child: Container(child: Text('War-O Flutter',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
                  widthFactor: 0.5,
                  heightFactor: 0.2,
                  ),
              elevation: 10,
              shadowColor: Colors.blue,
            ),
          FloatingActionButton(
            onPressed: _newGameHandler,
            tooltip: 'New Game',
            child: Icon(Icons.add),
          ),
          */
  }
}
