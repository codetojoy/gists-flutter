import 'package:flutter/material.dart';

import '../models/person.dart';

class PlayersWidget extends StatefulWidget {
  final Future<Result> _playersFuture;
  const PlayersWidget(this._playersFuture);

  @override
  State<PlayersWidget> createState() => _PlayersWidgetState();
}


class _PlayersWidgetState extends State<PlayersWidget> {
  List<Widget> _buildHasData(BuildContext context, AsyncSnapshot<Result> snapshot) {
    List<Widget> children = [];
    Result? result = snapshot.data;
    if (result != null) {
      var rows = result.people.map<Widget>((person) {
        return Text(person.name);
      }).toList();
      children = [
        Column(children: rows),
      ];
    } else {
      children = [
        Text('internal error'),
      ];
    }
    return children;
  }

  List<Widget> _buildError(BuildContext context, AsyncSnapshot<Result> snapshot) {
    List<Widget> children = <Widget>[
      const Icon(
        Icons.error_outline,
        color: Colors.red,
        size: 60,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Text('Error: ${snapshot.error}'),
      )
    ];
    return children;
  }

  List<Widget> _buildBusy(BuildContext context, AsyncSnapshot<Result> snapshot) {
    List<Widget> children = <Widget>[
      SizedBox(
        child: CircularProgressIndicator(),
        width: 60,
        height: 60,
      ),
      Padding(
        padding: EdgeInsets.only(top: 16),
        child: Text('Awaiting result...'),
      )
    ];
    return children;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.headline6!,
      textAlign: TextAlign.center,
      child: FutureBuilder<Result>(
        future: widget._playersFuture,
        builder: (BuildContext context, AsyncSnapshot<Result> snapshot) {
          List<Widget> children = [];
          if (snapshot.hasData) {
            children = _buildHasData(context, snapshot);
          } else if (snapshot.hasError) {
            children = _buildError(context, snapshot);
          } else {
            children = _buildBusy(context, snapshot);
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children,
            ),
          );
        },
      ),
    );
  }
}
