import 'package:flutter/material.dart';

import './logger.dart';
import './time.dart';
import './welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String _version() {
    var version = "xyz";
    var now = new Time().now();
    return 'waro v $version $now';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _version(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        secondaryHeaderColor: Colors.black,
      ),
      home: MyHomePage(title: _version()),
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

  void _start() {
    setState(() {
      L.log('hello from start');
    });
  }

  void _pushConfig() {
    L.log('hello from push config');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(icon: Icon(Icons.list), onPressed: _pushConfig),
          ],
        ),
        body: Welcome(_start));
  }
}
