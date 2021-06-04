import 'package:flutter/material.dart';

class Foo {
  String doIt(BuildContext context) {
    var result = 'N/A';
    final size = context.size;

    if (size != null) {
      final h = size.height;
      final w = size.width;
      result = 'height: $h , width: $w';
    }

    return result;
  }
}
