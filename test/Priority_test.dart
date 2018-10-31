import 'package:test/test.dart';

import 'package:perfecto/objects/Priority.dart';


void main() {

  test('Priority Constructor and level getter', () {
    Priority c = Priority.fromLevels('low');
    expect(c.level, 'low');
    c = Priority.fromLevels('so very high');
    expect(c.level, 'UNKNOWN');
  });
}