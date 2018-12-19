import 'package:cloud_firestore/cloud_firestore.dart';

/// Firestore stuff
class FirestoreServices {
  // Instance
  static Firestore instance = Firestore.instance;

  // Static Collection paths (immutable)
  static final String _projectsCollectionPath = 'projects';
  static final String _flowStoriesCollectionPath = 'projects/flow/backlog';
  static final String _flowTasksCollectionPath =
      'projects/flow/backlog/story_flow/tasks';

  // Static Collections (immutable)
  static final CollectionReference projectsCollection =
      instance.collection(_projectsCollectionPath);
  static final CollectionReference flowStoriesCollection =
      instance.collection(_flowStoriesCollectionPath);
  static final CollectionReference flowTasksCollection =
      instance.collection(_flowTasksCollectionPath);
}
