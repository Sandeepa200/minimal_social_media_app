/*

This database stores posts that users have published in the app.
It is stored in a collection called 'Posts' in Firebase

Each post contains;
— a message
- email of user
- timestamp

 */

import 'package:firebase_auth/firebase_auth.dart';

class FirestoreDatabase {
  // current logged in user
  User? user = FirebaseAuth.instance.currentUser;
// get collection of posts from firebase
// post a message
// read posts from database
}
