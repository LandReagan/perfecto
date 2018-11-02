class Task {

  static List<String> STATUS = ['To Do', 'In Progress', 'Done'];

  String title;
  String description;
  DateTime deadline;
  String _status;

  Task(this.title, {this.description = ''});

  Task.fromMap(Map<String, dynamic> data) {
    title = data['title'] ?? '#UNKNOWN#';
    //if (data.containsKey('description')) description = data['description'];
    description = data['description'] ?? '';
    if (data.containsKey('deadline') && data['deadline'] is String)
      deadline = DateTime.parse(data['deadline']);
    else deadline = null;
    //if (data.containsKey('status')) status = data['status'];
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

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'deadline': deadline.toIso8601String(),
      'status': status
    };
  }
}