import 'package:test/test.dart';

import 'package:perfecto/objects/Task.dart';

void main() {

  test('remainingTime getter', () {
    Task task = Task('A Task');
    expect(task.remainingTime, Duration.zero);
    task.deadline = DateTime(2018, 12, 31);
    print(task.remainingTime);
    print(task.toMap());
  });
}