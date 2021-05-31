import 'package:flutter/material.dart';
import 'package:media_query/my_media_query.dart';

import './logger.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Media Query Sandbox',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Media Query Sandbox'),
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

  void _buttonHandler(BuildContext context) {
    setState(() {
      _counter++;
      var mediaQuery = MediaQuery.of(context);
      var orientation = mediaQuery.orientation;
      var maxHeight = mediaQuery.size.height;
      var maxWidth = mediaQuery.size.width;
      L.log('button handler o: $orientation h: $maxHeight w: $maxWidth');
    });
  }

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: Text(widget.title),
    );
    var isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    var widgets = <Widget>[];

    if (isLandscape) {
      var myMediaQuery = MyMediaQuery([0.1, 0.3, 0.6], context, appBar);
      L.log('audit : ${myMediaQuery.audit()}');
      var widget1 = Container(
        height: myMediaQuery.values[0], // availableHeight * 0.1,
        decoration: BoxDecoration(
          color: Colors.black,
        ),
      );
      var widget2 = Container(
        height: myMediaQuery.values[1], // availableHeight * 0.3,
        decoration: BoxDecoration(
          color: Colors.blueGrey,
        ),
      );
      var widget3 = Container(
        height: myMediaQuery.values[2], // availableHeight * 0.6,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
      );

      widgets.add(widget1);
      widgets.add(widget2);
      widgets.add(widget3);
    } else {
      var myMediaQuery = MyMediaQuery([0.333, 0.333, 0.333], context, appBar);
      L.log('audit : ${myMediaQuery.audit()}');
      var widget1 = Container(
        height: myMediaQuery.values[0], // availableHeight * 0.333,
        decoration: BoxDecoration(
          color: Colors.black,
        ),
      );
      var widget2 = Container(
        height: myMediaQuery.values[1], // availableHeight * 0.333,
        decoration: BoxDecoration(
          color: Colors.blueGrey,
        ),
      );
      var widget3 = Container(
        height: myMediaQuery.values[2], // availableHeight * 0.333,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
      );

      widgets.add(widget1);
      widgets.add(widget2);
      widgets.add(widget3);
    }

    return Scaffold(
      appBar: appBar,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widgets,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _buttonHandler(context);
        },
        tooltip: 'Logger',
        child: Icon(Icons.timeline_outlined),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
