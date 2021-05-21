class Time {
  String now() {
    var now = DateTime.now();
    var minStr = now.minute.toString().padLeft(2, '0');
    var secStr = now.second.toString().padLeft(2, '0');
    return '${now.hour}:${minStr}:${secStr}';
  }
}
