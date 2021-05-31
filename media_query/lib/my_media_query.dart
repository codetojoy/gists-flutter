import 'package:flutter/material.dart';

import './logger.dart';

class MyMediaQuery {
  List<double> values = [];
  List<double> percentages = [];
  double _availableHeight = 0;

  MyMediaQuery(List<double> percentages, BuildContext context, AppBar appBar) {
    var mediaQuery = MediaQuery.of(context);
    final totalHeight = mediaQuery.size.height;
    final appBarHeight = appBar.preferredSize.height;
    final topPaddingHeight = mediaQuery.padding.top;
    _availableHeight = totalHeight - (appBarHeight + topPaddingHeight);

    values = percentages.map((percentage) {
      return _availableHeight * percentage;
    }).toList();
  }

  bool audit() {
    double valueSum = 0;
    values.forEach((value) => valueSum += value);

    final epislon = 0.9;
    final result = (valueSum - _availableHeight).abs() < epislon;
    L.log('MMQ.audit v: $valueSum a: $_availableHeight');

    return result;
  }
}
