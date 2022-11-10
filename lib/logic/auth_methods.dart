import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:itesogram/logic/storage_methods.dart';
import 'package:itesogram/models/user.dart' as model;

class AuthMethods {
  //create firebase instance
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot documentSnapshot =
        await _firestore.collection('users').doc(currentUser.uid).get();

    return model.User.fromSnap(documentSnapshot);
  }

  //Sign Up
  Future<String> signUpUser({
    //Fire_Auth
    required String email,
    required String password,
    //Firestore database
    required String username,
    required String bio,
    required Uint8List file,
  }) async {
    String errorMessage = 'An error occurred';

    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty ||
          file != null) {
        //Register User
        UserCredential credential = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        String photoUrl = await StorageMethods()
            .uploadImageToFirestore('profilepic', file, false);

        //Add user to database
        model.User user = model.User(
          username: username,
          uid: credential.user!.uid,
          photoUrl: photoUrl,
          email: email,
          bio: bio,
          followers: [],
          following: [],
        );

        await _firestore.collection('users').doc(credential.user!.uid).set(
              user.toJson(),
            );
        errorMessage = 'User registered!';
      }
    } on FirebaseAuthException catch (err) {
      //detail error messages
      if (err.code == 'invalid-email') {
        errorMessage = 'wrong email format';
      }
    } catch (err) {
      errorMessage = err.toString();
    }
    return errorMessage;
  }

  //Login User
  Future<String> loginUser(
      {required String email, required String password}) async {
    String errorMessage = 'An error occurred';

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        errorMessage = 'Login success';
      } else {
        errorMessage = 'Login error';
      }
    } catch (err) {
      errorMessage = err.toString();
    }
    return errorMessage;
  }
}
