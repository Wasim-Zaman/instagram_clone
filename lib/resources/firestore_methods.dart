import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone_app/models/post.dart';
import 'package:instagram_clone_app/resources/storage_methods.dart';
import 'package:uuid/uuid.dart';

class FireStoreMethods {
  final _firestore = FirebaseFirestore.instance;

  // upload post
  Future<String> uploadPost(
    String description,
    Uint8List file,
    String uid,
    String username,
    String profImage,
  ) async {
    // asking uid here because we dont want to make extra calls to firebase auth when we can just get from our state management
    String res = "Some error occurred";
    try {
      String postUrl =
          await StorageMethods().uploadImageToStorage('posts', file, true);
      String postId = const Uuid().v1(); // creates unique id based on time

      Post post = Post(
        postId: postId,
        description: description,
        postUrl: postUrl,
        uid: uid,
        username: username,
        profImage: profImage,
        datePublished: DateTime.now(),
        likes: [],
        comments: [],
      ); // creating post object

      _firestore.collection('posts').doc(postId).set(post.toJson());
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // Like and unlike post
  Future<String> likePost(String postId, String uid, List likes) async {
    String res = "Some error occurred";
    var post = _firestore.collection('posts').doc(postId);
    try {
      if (likes.contains(uid)) {
        // if the likes list contains the user uid, we need to remove it
        post.update({
          'likes': FieldValue.arrayRemove([uid])
        });
      } else {
        // else we need to add uid to the likes array
        post.update({
          'likes': FieldValue.arrayUnion([uid])
        });
      }
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // add comment
  Future<String> postComment(
    String postId,
    String comment,
    String uid,
    String username,
    String profImage,
  ) async {
    String res = "Some error occurred";
    try {
      if (comment.isEmpty) {
        throw 'Comment cannot be empty';
      }
      String commentId = const Uuid().v1();
      _firestore
          .collection('posts')
          .doc(postId)
          .collection('comments')
          .doc(commentId)
          .set({
        'commentId': commentId,
        'comment': comment,
        'uid': uid,
        'username': username,
        'profImage': profImage,
        'datePublished': DateTime.now(),
      });
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
