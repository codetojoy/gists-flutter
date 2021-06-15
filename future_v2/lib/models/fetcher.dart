import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import './person.dart';

// TODO: this should be in `services` (or similar) not `models`
class Fetcher {
  static const host = 'localhost:8080';
  static const context = '/scooter/players';

  Future<Result> getPlayers() async {
    var delay = 2;
    var queryParams = {
      'delay_in_seconds': '$delay',
    };
    print('TRACER fetchCard');
    var url = Uri.http(host, context, queryParams);
    final response = await http.get(url);

    print('TRACER fetchCard status: ${response.statusCode}');
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      //
      // re: UTF-8 issue: https://stackoverflow.com/questions/51368663
      return Result.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
