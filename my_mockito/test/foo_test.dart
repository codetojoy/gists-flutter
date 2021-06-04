import 'package:flutter/material.dart';
import 'package:mockito/mockito.dart';
import 'package:my_mockito/foo.dart';
import 'package:test/test.dart';

class MockBuildContext extends Mock implements BuildContext {}

class MockSize extends Mock implements Size {}

void main() {
  group('Foo', () {
    setUp(() {});

    test('simple doIt', () {
      var size = Size(4140.0, 5150.0);
      var buildContext = MockBuildContext();
      when(buildContext.size).thenReturn(size);

      // test
      var result = new Foo().doIt(buildContext);

      expect('height: 5150.0 , width: 4140.0', result);
    });

    // end group
  });
}
