import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class DatabaseService {
  final String? id;
  DatabaseService({this.id});
  // collection reference
  final CollectionReference inforCollection =
      FirebaseFirestore.instance.collection('cards');

  Future updateCardData(String tiltle, bool completed) async {
    return await inforCollection.doc(id).set({
      'title': tiltle,
      'completed': completed,
    });
  }

  Future<void> deleteCardData() {
    return inforCollection.doc(id).delete();
  }
}
