import 'package:flutter/material.dart';

import './auditor.dart';

class MyMediaQuery {
  List<double> values = [];
  List<double> _percentages = [];
  double _availableHeight = 0;
  final auditor = new Auditor();

  MyMediaQuery(List<double> percentages, BuildContext context, AppBar appBar) {
    var mediaQuery = MediaQuery.of(context);
    final totalHeight = mediaQuery.size.height;
    final appBarHeight = appBar.preferredSize.height;
    final topPaddingHeight = mediaQuery.padding.top;
    _availableHeight = totalHeight - (appBarHeight + topPaddingHeight);

    _percentages = percentages;
    values = _percentages.map((percentage) {
      return _availableHeight * percentage;
    }).toList();
  }

  bool audit() {
    return auditPercentages() && auditValues();
  }

  bool auditPercentages() {
    return auditor.auditPercentages(_percentages);
  }

  bool auditValues() {
    return auditor.auditValues(values, _availableHeight);
  }
}
