import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Login Method
  Future<UserCredential?> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw e; // Re-throwing the exception to handle it in the UI
    } catch (e) {
      throw Exception("An error occurred during login.");
    }
  }

  // Logout Method
  Future<void> logout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      throw Exception("Error during logout.");
    }
  }

  // Register Method
  Future<UserCredential?> registerWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw e; // Throw exception to handle it in UI
    } catch (e) {
      throw Exception("An error occurred during registration.");
    }
  }

  // Create a Firestore document for the user
  Future<void> createUserDocument(UserCredential? userCredential, String username) async {
    if (userCredential != null && userCredential.user != null) {
      try {
        await _firestore.collection('users').doc(userCredential.user!.email).set({
          'email': userCredential.user!.email,
          'username': username,
        });
      } catch (e) {
        throw Exception("Error creating user document.");
      }
    }
  }
}
