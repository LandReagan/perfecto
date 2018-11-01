import 'package:cloud_firestore/cloud_firestore.dart';


class FirestoreServices {

  // Paths
  static String flowTasksCollectionPath =
      'projects/flow/backlof/story_flow/tasks';



  // PRIVATE___________________________________________________________________

  // Collections references
  static CollectionReference _getFlowTasksCollection() {
    return Firestore.instance.collection(flowTasksCollectionPath);
  }

  // Private methods
  static Stream<QuerySnapshot> _getFlowTasksDocumentsStream() {
    return _getFlowTasksCollection().snapshots();
  }
}