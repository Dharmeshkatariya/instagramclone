import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FeedScreenController extends GetxController {
  final fireStore1 = FirebaseFirestore.instance.collection("users").doc("lloZUXWFD7cDKQIf52YChkvn2fy1").snapshots();
  final fireStore = FirebaseFirestore.instance.collection("posts").snapshots();
  final fireStoreCollection = FirebaseFirestore.instance.collection("users");

  @override
  void onInit() {
    // getMarker();
    super.onInit();
  }

  // getMarker() async {
  //   var snapshot = await FirebaseFirestore.instance.collection("users").doc("YlZHj3x69UYf1MS8w9aQZvLncMq2");
  //   DocumentSnapshot docSnap = await snapshot.get();
  //   var doc_id2 = docSnap.reference.snapshots();
  //   print(doc_id2);
  // }
}
