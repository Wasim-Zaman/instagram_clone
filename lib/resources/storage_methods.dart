import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class StorageMethods {
  FirebaseStorage storage = FirebaseStorage.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  // Adding image to FirebaseStorage
  Future<String> uploadImageToStorage(
    String childName,
    Uint8List file,
    bool isPost,
  ) async {
    var uid = auth.currentUser!.uid;

    // First we need a reference to the FirebaseStorage, where we will store the image
    Reference ref = storage.ref().child(childName).child(uid);

    // if we are doing post then we will do some extra stuff
    if (isPost) {
      String id = const Uuid().v1();
      ref = ref.child(id);
    }

    // Then we will upload our image to that reference
    UploadTask uploadTask = ref.putData(file);

    // Then we will need download path where our actual file is stored
    TaskSnapshot snapshot = await uploadTask;
    String path = await snapshot.ref.getDownloadURL();

    return path;
  }
}
