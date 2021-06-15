import 'dart:async';
import 'dart:convert';
import 'dart:io' show Platform;

import 'package:http/http.dart' as http;

import 'package:flutter/foundation.dart';

import './person.dart';

class Api {
  static const LOCALHOST = 'localhost:8080';
  static const ANDROID_URI = '10.0.2.2:8080';
  String getUri() {
    var result = LOCALHOST;
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      // TODO
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      result = ANDROID_URI;
    } else if ((defaultTargetPlatform == TargetPlatform.linux) || (defaultTargetPlatform == TargetPlatform.macOS) || (defaultTargetPlatform == TargetPlatform.windows)) {
      // TODO
    }
    else {
      // no-op
    }
    return result;
  }
}

// TODO: this should be in `services` (or similar) not `models`
class Fetcher {
  static const context = '/scooter/players';

  Future<Result> getPlayers() async {
    var delay = 2;
    var doShuffle = true;
    var queryParams = {
      'delay_in_seconds': '$delay',
      'do_shuffle': '$doShuffle',
    };
    print('TRACER fetchCard');
    // TODO: add ios
    var host = new Api().getUri();
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
