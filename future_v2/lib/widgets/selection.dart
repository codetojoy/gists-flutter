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
      style: Theme.of(context).textTheme.headline2!,
      textAlign: TextAlign.center,
      child: FutureBuilder<Result>(
        future: widget
            ._selectFuture, // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<Result> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            Result? result = snapshot.data;
            var name = "n/a";
            if (result != null) {
              name = result.people[0].name;
            }
            children = <Widget>[
              Text('name is $name'),
              const Icon(
                Icons.check_circle_outline,
                color: Colors.green,
                size: 60,
              ),
            ];
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
