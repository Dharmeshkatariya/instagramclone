import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/addpost_controller.dart';
import 'package:untitled/method/firestoire%20method.dart';
import 'package:untitled/utills/colors.dart';

class AddPostScreen extends GetView<AddPostScreenController> {
  AddPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: mobileBackgroundColor,
          title:  Text("email".tr),
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back),
          ),
          actions: [
            TextButton(
                onPressed: () {

                },
                child: const Text(
                  "Post",
                  style: TextStyle(
                      color: Colors.blueAccent, fontWeight: FontWeight.bold),
                ))
          ],
        ),
        body: Obx(
          () => controller.imagePath.isEmpty
              ? Center(
                  child: IconButton(
                    onPressed: () {
                      _showBottom(
                          text: "Select gallery",
                          onPressed: () {
                            controller.getImageGallery();
                          });
                    },
                    icon: const Icon(Icons.upload_outlined),
                  ),
                )
              : Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            child: Image.file(File(controller.imagePath.value)),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: controller.descriptionController,
                              decoration: const InputDecoration(
                                hintText: "write caption",
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          CircleAvatar(
                              child:
                                  Image.file(File(controller.imagePath.value))),
                        ],
                      ),
                      GestureDetector(
                        onTap: (){

                        },

                        child: Container(
                          color: primaryColor,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                          margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                          child: const Text("Post",style: TextStyle(color: secondaryColor),),
                        ),
                      )
                    ],
                  ),
                ),
        ));
  }

  _showBottom({VoidCallback? onPressed, required String text}) {
    Get.bottomSheet(
        Container(
            height: 200,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            color: primaryColor,
            child: TextButton(
              onPressed: onPressed,
              child: Text(
                text,
                style: const TextStyle(color: mobileBackgroundColor),
              ),
            )),
        enterBottomSheetDuration: const Duration(seconds: 1));
  }

  _postImage({
    required String uid,
    required String profImage,
    required String postUrl,
    required String username,
  }) async {
    String res = FireStoreMethod().uploadPost(
        imagepath: controller.imagePath.value,
        description: controller.descriptionController.text,
        uid: uid,
        username: username,
        profImage: profImage,
        postUrl: postUrl);
  }

// _snapshotDelete(
//     {required AsyncSnapshot<QuerySnapshot> snapshot, required int index}) {
//   fireStoreCollection
//       .doc(snapshot.data!.docs[index]["id"].toString())
//       .delete();
// }
}
