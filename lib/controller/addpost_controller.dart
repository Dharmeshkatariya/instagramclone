import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AddPostScreenController extends GetxController{
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
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
  _upload(){
    firestore.collection("users").doc(auth.currentUser!.uid).get();
  }
}