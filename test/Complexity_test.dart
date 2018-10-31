import 'package:test/test.dart';

import 'package:perfecto/objects/Complexity.dart';


void main() {

  test('Complexity Constructor and level getter', () {
    Complexity c = Complexity.fromTShirts('L');
    expect(c.level, 'L');
    c = Complexity.fromTShirts('XXXXXXXXL');
    expect(c.level, 'UNKNOWN');
  });
}