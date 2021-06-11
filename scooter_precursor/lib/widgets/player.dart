import 'package:flutter/material.dart';

import '../models/person.dart';

class Player extends StatelessWidget {
  final Person _person;

  Player(this._person);

  @override
  Widget build(BuildContext context) {
    final fontSize = 24.0;
    var textStyle = TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold);
    return InkWell(
        onTap: () {
          // setState(() {
          // });
          // print('hello from card: $_card');
        },
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Text(_person.shortName,
              style: Theme.of(context).textTheme.headline6),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [_person.color.withOpacity(0.7), _person.color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ));
  }
}
