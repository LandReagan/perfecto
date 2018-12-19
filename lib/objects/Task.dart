import 'dart:convert' show json;

import 'package:perfecto/database/DatabaseMeta.dart' show DatabaseMeta;

/// A Task represents the smallest piece of work. It has at least a title and an
/// id (which is normally provided by the database). Other fields optional.
class Task with DatabaseMeta {

  /// Possible status of a Task.
  static List<String> STATUS = ['To Do', 'In Progress', 'Done'];

  String title;
  String description;
  DateTime deadline;
  String _status;

  Task(this.title, {externalId, this.description = ''}){
    _status = 'To Do';
    if (externalId == null) {
      //TODO: find a plugin and provide a uid
    } else {
      id = externalId;
    }
    creationDateTime = DateTime.now();
  }

  Task.fromMap(Map<String, dynamic> data) {

    id = data['id'];

    if (data.containsKey('creationDateTime') && data['creationDateTime'] is String)
      creationDateTime = DateTime.parse(data['creationDateTime']);
    else creationDateTime = null;

    title = data['title'] ?? '#UNKNOWN#';
    //if (data.containsKey('description')) description = data['description'];
    description = data['description'] ?? '';

    if (data.containsKey('deadline') && data['deadline'] is String)
      deadline = DateTime.parse(data['deadline']);
    else deadline = null;

    status = data['status'] ?? 'To Do';
  }

  Duration get remainingTime {
    return deadline == null ?
        Duration.zero : deadline.difference(DateTime.now());
  }

  String get status => _status;

  set status(String str) {
    if (STATUS.contains(str)) _status = str;
  }

  /// Provides a guaranteed Task description in a Map<String, String>
  Map<String, dynamic> toMap() {
    return {
      'id': id ?? '#UNKNOWN#',
      'creationDateTime': creationDateTime?.toIso8601String() ?? '#UNKNOWN#',
      'title': title ?? '#UNKNOWN#',
      'description': description ?? '',
      'deadline': deadline?.toIso8601String() ?? '',
      'status': status ?? ''
    };
  }

  // DEBUG
  @override
  String toString() {
    return json.encode(this.toMap());
  }
}