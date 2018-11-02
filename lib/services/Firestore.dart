import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:perfecto/objects/Task.dart';


class FirestoreServices {

  // Paths
  static String flowTasksCollectionPath =
      'projects/flow/backlog/story_flow/tasks';

  // Stream transformers
  static StreamTransformer querySnapshotToTaskListTransformer =
    StreamTransformer<QuerySnapshot, List<Task>>.fromHandlers(
      handleData: (data, sink) {
        List<Task> tasks = [];
        data.documents.forEach((documentSnapshot) {
          tasks.add(Task.fromMap(documentSnapshot.data));
        });
        sink.add(tasks);
      },
  );

  // Getter of the stream of flow tasks
  static Stream<List<Task>> getFlowTasksStream() {
    return _getFlowTasksCollection().snapshots().transform(
        querySnapshotToTaskListTransformer
    );
  }

  // PRIVATE___________________________________________________________________

  // Collections references
  static CollectionReference _getFlowTasksCollection() {
    return Firestore.instance.collection(flowTasksCollectionPath);
  }

  static void testFirestore() async {
    print('Firestore tests:');
    await _getFlowTasksCollection().getDocuments().then((querySnapshot) {
        print('FlowTasks number: ' + querySnapshot.documents.length.toString());
      });
    await Firestore.instance.collection('projects').getDocuments()
      .then((querySnapshot) {
        print('Projects number: ' + querySnapshot.documents.length.toString());
      });
  }
}
