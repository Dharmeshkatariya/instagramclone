import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled/modal/post.dart';
import 'package:untitled/method/storagemethod.dart';
import 'package:uuid/uuid.dart';

class FireStoreMethod {
  final FirebaseFirestore fireStore = FirebaseFirestore.instance;

  //upload post

  uploadPost(
      {required String imagepath,
      required String description,
      required String uid,
      required String username,
      required String profImage,
      required String postUrl}) async {
    String postId = Uuid().v1();
    String res = "some error";
    try {
      String photoUrl =
          StorageMethod().uploadImageToStorage("posts", true, imagepath);
      Post post = Post(
          description: description,
          uid: uid,
          username: username,
          likes: [],
          postId: postId,
          datePublished: DateTime.now(),
          postUrl: postUrl,
          profImage: profImage);

      fireStore.collection("posts").doc(postId).set(post.toJson());
      res = "succes";
    } catch (e) {
      res = e.toString();
      print(e);

    }
    return res;
  }
}
