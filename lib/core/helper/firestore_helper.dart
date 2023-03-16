import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreHelper {
  final _client = FirebaseFirestore.instance;
  final _user = FirebaseAuth.instance;

  // get collection
  CollectionReference getCollection(String path) {
    return _client
        .collection(path)
        .doc(_user.currentUser!.uid)
        .collection(path);
  }

  // get document in collection by id
  Future<DocumentSnapshot> getDocumentById(String path, String id) async {
    return _client
        .collection(path)
        .doc(_user.currentUser!.uid)
        .collection(path)
        .doc(id)
        .get();
  }

  // update document by id
  Future<void> updateDocumentById(
      String path, String id, Map<String, dynamic> data) async {
    _client
        .collection(path)
        .doc(_user.currentUser!.uid)
        .collection(path)
        .doc(id)
        .update(data);
  }

  Future<void> addDocumentById(
      String path, String id, Map<String, dynamic> data) async {
    _client
        .collection(path)
        .doc(_user.currentUser!.uid)
        .collection(path)
        .doc(id)
        .set(data);
  }

  // delete document by id
  Future<void> deleteDocumentById(String path, String id) async {
    _client
        .collection(path)
        .doc(_user.currentUser!.uid)
        .collection(path)
        .doc(id)
        .delete();
  }
}
