import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import './person.dart';

class ApiStrategy {
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
      return Result.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}
