import 'package:flutter/material.dart';

import '../models/card.dart' as waro_c;

class CardWidget extends StatelessWidget {
  final waro_c.Card _card;
  final Function _selectHandler;
  final String _tooltip;

  CardWidget(this._card, this._selectHandler, this._tooltip);

  @override
  Widget build(BuildContext context) {
    final fontSize = 24.0;
    var textStyle = TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold);
      return InkWell(
        onTap: () {
          // setState(() {
          // });
            print('hello from card: $_card');
        },
        splashColor: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Text(_card.toString(), style: Theme.of(context).textTheme.headline6),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [_card.color.withOpacity(0.7), _card.color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ));
    /*
    return FloatingActionButton(
      onPressed: () => _selectHandler(),
      tooltip: _tooltip,
      child:
          Text(_card.toString(), textAlign: TextAlign.center, style: textStyle),
    );
    */
  }
}
