import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:perfecto/objects/Task.dart';


class Database {

  static Future<List<Task>> getFlowTasks() async {
    print('Database.getFlowTask call...');
    CollectionReference tasksCollection = _getFlowTasksCollection();
    List<DocumentSnapshot> documents = (await tasksCollection.getDocuments()).documents;
    List<Task> tasks = [];
    documents.forEach((document) => tasks.add(Task.fromMap(document.data)));
    print('Database.getFlowTask end!');
    return tasks;
  }

  // INTERNAL STUFF............................................................

  static CollectionReference _getProjectsCollection() {
    return Firestore.instance.collection('projects');
  }

  static CollectionReference _getFlowTasksCollection() {
    return Firestore.instance.collection(
        'projects/flow/backlof/story_flow/tasks');
  }
}