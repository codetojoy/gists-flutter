import 'package:flutter/material.dart';

import '../models/person.dart';

class PlayersWidget extends StatefulWidget {
  final Future<Result> _playersFuture;
  const PlayersWidget(this._playersFuture);

  @override
  State<PlayersWidget> createState() => _PlayersWidgetState();
}

class _PlayersWidgetState extends State<PlayersWidget> {
    Widget _buildEntry(BuildContext context, String text) {
      var fontSize = 12.0;
      var textStyle = TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold);
      var accentColor = Theme.of(context).accentColor;
      return InkWell(
          onTap: () {},
          splashColor: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(15),
          child: Center(
              child: Container(
            padding: const EdgeInsets.all(15),
            child: Text(text, style: textStyle),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [accentColor.withOpacity(0.7), accentColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
      )));
    }

  List<Widget> _buildHasData(BuildContext context, AsyncSnapshot<Result> snapshot) {
    List<Widget> children = [];
    Result? result = snapshot.data;
    if (result != null) {
      var widgets = result.people.map<Widget>((person) {
        return _buildEntry(context, person.name);
      }).toList();

      var card = Card(
        child: Container(
            height: 400,
            width: double.infinity,
            child: GridView(
                padding: const EdgeInsets.all(20),
                children: widgets,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 120,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ))),
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        color: Theme.of(context).primaryColorLight);
      children = [card];
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
          if (snapshot.connectionState != ConnectionState.done) {
            children = _buildBusy(context, snapshot);
          } else if (snapshot.hasError) {
            children = _buildError(context, snapshot);
          } else if (snapshot.hasData) {
            children = _buildHasData(context, snapshot);
          }
          /*
          if (snapshot.hasData) {
            children = _buildHasData(context, snapshot);
          } else if (snapshot.hasError) {
            children = _buildError(context, snapshot);
          } else {
            children = _buildBusy(context, snapshot);
          }
          */
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
