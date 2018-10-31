class Task {

  static List<String> STATUS = ['To Do', 'In Progress', 'Done'];

  String title;
  String description;
  DateTime deadline;
  String status;

  Task(this.title, {this.description = ''});

  Task.fromMap(Map<String, dynamic> data) {
    title = data['title'];
    if (data.containsKey('description')) description = data['description'];
    if (data.containsKey('deadline'))
      deadline = DateTime.parse(data['deadline']);
    if (data.containsKey('status')) {
      if (STATUS.contains(data['status'])) status = data['status'];
    }
  }

  Duration get remainingTime {
    return deadline == null ?
        Duration.zero : deadline.difference(DateTime.now());
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