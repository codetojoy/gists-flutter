import './time.dart';

class L {
  static void log(String s) {
    var now = new Time().now();
    print('TRACER [$now] => $s');
  }
}
