import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FeedScreenController extends GetxController{


  final fireStore = FirebaseFirestore.instance.collection("users").snapshots();
  final fireStoreCollection = FirebaseFirestore.instance.collection("users");
}