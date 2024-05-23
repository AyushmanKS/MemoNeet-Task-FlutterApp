import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreDatabase {
  // current user
  User? user = FirebaseAuth.instance.currentUser;

  // retrieveing collection of thoughts os current user
  final CollectionReference thoughts =
      FirebaseFirestore.instance.collection('Thoughts');

  // post/Create a thought
  Future<void> addThought(String message) {
    return thoughts.add({
      'UserEmail': user!.email,
      'ThoughtMessage': message,
      'TimeStamp': Timestamp.now(),
    });
  }

  // delete a thought by document ID
  Future<void> deleteThought(String docId) {
    return thoughts.doc(docId).delete();
  }

  // Reading thoughts from database
  Stream<QuerySnapshot> getThoughtsStream() {
    final thoughtStream = FirebaseFirestore.instance
        .collection('Thoughts')
        .orderBy('TimeStamp', descending: true)
        .snapshots();

    return thoughtStream;
  }
}
