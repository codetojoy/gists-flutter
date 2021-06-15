import 'package:flutter/material.dart';

import '../models/person.dart';

class SelectionWidget extends StatefulWidget {
  final Future<Result> _selectFuture;
  const SelectionWidget(this._selectFuture);

  @override
  State<SelectionWidget> createState() => _SelectionWidgetState();
}

class _SelectionWidgetState extends State<SelectionWidget> {
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.headline6!,
      textAlign: TextAlign.center,
      child: FutureBuilder<Result>(
        future: widget
            ._selectFuture, // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<Result> snapshot) {
          List<Widget> children = [];
          if (snapshot.hasData) {
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

          } else if (snapshot.hasError) {
            children = <Widget>[
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
          } else {
            children = const <Widget>[
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
