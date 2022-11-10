import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class StorageMethods {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Add images Firestore
  Future<String> uploadImageToFirestore(
      String childName, Uint8List file, bool isPost) async {
    //Child of posts and a child of uid of user
    Reference ref =
        _storage.ref().child(childName).child(_auth.currentUser!.uid);

    //Generate id if its a post and generate id for it
    if (isPost) {
      String id = const Uuid().v1();
      ref = ref.child(id);
    }

    UploadTask uploadTask = ref.putData(file);

    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }
}
