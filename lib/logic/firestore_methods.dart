import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:itesogram/logic/storage_methods.dart';
import 'package:itesogram/models/posts.dart';
import 'package:uuid/uuid.dart';

class FireStoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadPost(String description, Uint8List file, String uid,
      String username, String profImage) async {
    String errorMessage = 'Ups! Something wrong happend';

    try {
      String photoUrl =
          await StorageMethods().uploadImageToFirestore('posts', file, true);

      //Flutter package to generate Unique identifiers
      var uuid = Uuid();
      String postId = uuid.v1();

      Post post = Post(
        description: description,
        uid: uid,
        username: username,
        postId: postId,
        datePublish: DateTime.now(),
        postUrl: photoUrl,
        profImage: profImage,
        likes: [],
      );

      //UPLOAD TO FIREBASE-FIRESTORE
      _firestore.collection('posts').doc(postId).set(post.toJson());
      errorMessage = 'Uploaded with success';
    } catch (e) {
      errorMessage = e.toString();
    }
    return errorMessage;
  }
}
