import 'package:perfecto/objects/Complexity.dart';
import 'package:perfecto/objects/Priority.dart';
import 'package:perfecto/objects/Task.dart';


class Story {

  String title;
  String description;
  Complexity complexity;
  Priority priority;
  String definitionOfDone;
  List<Task> tasks;

  Story(this.title, {this.description, this.complexity, this.priority,
      this.definitionOfDone}) {
    if (description == null) description = '';
    if (complexity == null) complexity = Complexity.fromTShirts('S');
    if (priority == null) priority = Priority.fromLevels('low');
    tasks = [];
  }

  String get complexityLevel => complexity.level;
  String get priorityLevel => priority.level;

  void addTask(Task task) => tasks.add(task);
}