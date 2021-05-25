import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './card.dart' as my_card;

Future<my_card.Card> fetchCard() async {
  final host = 'localhost:8080';
  final context = '/waro/strategy';
  var prizeCard = 10;
  var mode = 'max';
  var maxCard = 12;
  var cards = ['4', '6'];
  var queryParams = {
    'prize_card': '$prizeCard',
    'mode': '$mode',
    'max_card': '$maxCard',
    'cards': cards,
  };
  print('TRACER cp 1 begin');
  var url = Uri.http(host, context, queryParams);
  final response = await http.get(url);
  print('TRACER cp 1.1 post get');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print('TRACER cp 2 HTTP OK');
    return my_card.Card.fromJson(jsonDecode(response.body));
  } else {
    print('TRACER cp 3');
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('TRACER failed to load card');
  }
}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<my_card.Card> futureCard;

  @override
  void initState() {
    super.initState();
    futureCard = fetchCard();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<my_card.Card>(
            future: futureCard,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var value = snapshot.data!.value;
                return Text('card selected: $value');
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
