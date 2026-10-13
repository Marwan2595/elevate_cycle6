import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@module
abstract class FirestoreModule {
  @singleton
  FirestoreService get firestoreService =>
      FirestoreService(FirebaseFirestore.instance);
}

// CRUD operations (Create, Read, Update, Delete) for Firestore collections and documents.
/// Thin, reusable wrapper around Cloud Firestore.
/// Every method works on a collection path, so it is not tied to any feature.
class FirestoreService {
  FirestoreService(this._firestore);
  final FirebaseFirestore _firestore;
  //PATH --> "/chats" OR "chats/23765uayshbfc827f/messages"
  CollectionReference<Map<String, dynamic>> collection(String path) =>
      _firestore.collection(path);

  /// Reads a whole collection. [queryBuilder] lets the caller add
  /// where / orderBy / limit without exposing the Firestore instance.
  Future<List<Map<String, dynamic>>> getCollection(
    String path, {
    Query<Map<String, dynamic>> Function(Query<Map<String, dynamic>> query)?
    queryBuilder,
  }) async {
    Query<Map<String, dynamic>> query = collection(path);
    if (queryBuilder != null) query = queryBuilder(query);
    final snapshot = await query.get();
    return snapshot.docs.map(_withId).toList();
  }

  Future<Map<String, dynamic>?> getDocument(String path, String id) async {
    final doc = await collection(path).doc(id).get();
    return doc.exists ? _withId(doc) : null;
  }

  /// Creates a document. Returns the generated id when [id] is null.
  Future<String> addDocument(
    String path,
    Map<String, dynamic> data, {
    String? id,
  }) async {
    // if collection is not exists then it will be created automatically when we add a document to it.
    // create document with a specific id
    // Inserts the data into the document, overwriting any existing data.
    final ref = await collection(path).add(data);

    return ref.id;
  }

  Future<void> updateDocument(
    String path,
    String id,
    Map<String, dynamic> data,
  ) => collection(path).doc(id).update(data);

  Future<void> deleteDocument(String path, String id) =>
      collection(path).doc(id).delete();

  /// Realtime updates of a collection.
  Stream<List<Map<String, dynamic>>> watchCollection(String path) =>
      collection(path).snapshots().map((s) => s.docs.map(_withId).toList());

  /// Merges the document id into the data under the `id` key.
  Map<String, dynamic> _withId(DocumentSnapshot<Map<String, dynamic>> doc) => {
    ...?doc.data(),
    'id': doc.id,
  };
}
