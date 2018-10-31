import 'package:test/test.dart';

import 'package:perfecto/objects/Story.dart';
import 'package:perfecto/objects/Complexity.dart';


void main() {
  group('Story tests...', () {

    test('Minimal Constructor', () {
      Story story = Story('A Story');
      expect(story.title, 'A Story');
      expect(story.description, '');
      expect(story.complexityLevel, 'S');
      expect(story.priorityLevel, 'low');
      expect(story.tasks.length, 0);
    });

    test('Constructor with complexity', () {
      Story story = Story('A Story', complexity: Complexity.fromTShirts('XL'));
      expect(story.complexityLevel, 'XL');
    });
  });
}