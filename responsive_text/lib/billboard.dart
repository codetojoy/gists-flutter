import 'package:flutter/material.dart';

class Billboard extends StatelessWidget {
  final String _message;

  Billboard(this._message);

  Widget _build(double heightPercentage) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return Card(elevation: 10, child: Container(
        height: constraints.maxHeight * heightPercentage,
        child: FittedBox(child: Text(_message)),
      ));
    });
  }

  Widget _buildLandscape() {
    print('TRACER Billboard landscape');
    return _build(0.2);
  }

  Widget _buildPortrait() {
    print('TRACER Billboard portrait');
    return _build(0.1);
  }

  @override
  Widget build(BuildContext context) {
    var isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return (isLandscape) ? _buildLandscape() : _buildPortrait();
  }
}
