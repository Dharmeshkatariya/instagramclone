import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/method/firestoire%20method.dart';

class AddPostScreenController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    _getData();
    super.onInit();
  }

  var uid;

  var userimage;

  var username;

  _getData() async {
    var shareP = await SharedPreferences.getInstance();
    uid = shareP.getString("uid");
    username = shareP.getString("username");
    userimage = shareP.getString("userimage");
  }

  final descriptionController = TextEditingController();
  RxString imagePath = "".obs;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  getImageGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    imagePath.value = image!.path;
    update();
  }

  getImageCamera() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    imagePath.value = image!.path;
    update();
  }

  uploadPostFirestore() {
    FireStoreMethod().uploadPost(
      imagepath: imagePath.value,
      description: descriptionController.text,
      uid: uid,
      username: username,
      profImage: userimage,
    );
  }
}
