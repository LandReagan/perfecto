import 'package:cloud_firestore/cloud_firestore.dart';


class Database {

  static List<DocumentSnapshot> getProjects() {

  }

  static Stream getFlowTasksStream() {
    return _getFlowTasksCollection().snapshots();
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