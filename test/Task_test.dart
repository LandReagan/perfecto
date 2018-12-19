import 'package:test/test.dart';

import 'package:perfecto/objects/Task.dart';

void main() {


  test('Default Task constructor', () {
    Task task = Task('A Task');
    expect(task.remainingTime, Duration.zero);
    expect(task.description, '');
    expect(task.deadline, null);
    expect(task.status, 'To Do');
  });

  test('Task.toMap() method', () {
    Task task = Task('An other task', description: 'This is another task (in paradise)!');
    task.deadline = DateTime(1978, 11, 15, 03, 40);
    task.status = 'To Do';
    Map<String, dynamic> taskMap = {
      'id': 'NO_ID!',
      'title': 'An other task',
      'description': 'This is another task (in paradise)!',
      'deadline': '1978-11-15T03:40:00.000',
      'status': 'To Do'
    };

    var mapped = task.toMap();
    expect(mapped, isNotNull);
    expect(mapped, isMap);
    expect(mapped['id'], '#UNKNOWN#');
    expect(mapped['creationDateTime'] is String, isTrue);
    expect(mapped['title'], 'An other task');
    expect(mapped['deadline'], '1978-11-15T03:40:00.000');
    expect(mapped['status'], 'To Do');
    expect(mapped['description'], 'This is another task (in paradise)!');
  });

  test('Task.fromMap() constructor', () {
    Map<String, String> taskMap = {
      'title': 'An other task',
      'description': 'This is another task (in paradise)!',
      'deadline': '1978-11-15T03:40:00.000',
      'status': 'To Do'
    };
    Task task = Task.fromMap(taskMap);

    expect(task.title, 'An other task');
    expect(task.description, 'This is another task (in paradise)!');
    expect(task.deadline, DateTime(1978, 11, 15, 03, 40));
    expect(task.status, 'To Do');
  });

  test('Task.toString() method', () {
    Map<String, String> taskMap = {
      'title': 'An other task',
      'description': 'This is another task (in paradise)!',
      'status': 'To Do'
    };
    Task task = Task.fromMap(taskMap);
    expect(task.toString() is String, isTrue);
    expect(task.toString().length, 156);
  });
}