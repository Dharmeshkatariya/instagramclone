import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/addpost_controller.dart';
import 'package:untitled/utills/colors.dart';

class AddPostScreen extends GetView<AddPostScreenController> {
  AddPostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: mobileBackgroundColor,
          title: Text("email".tr),
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back),
          ),
          actions: [
            TextButton(
                onPressed: () {},
                child: const Text(
                  "Post",
                  style: TextStyle(
                      color: Colors.blueAccent, fontWeight: FontWeight.bold),
                ))
          ],
        ),
        body: Obx(
          () => Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.getImageGallery();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(15)),
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    margin: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text(
                          "Open the  Gallery",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Icon(Icons.upload_outlined),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    controller.imagePath.value.isNotEmpty?  CircleAvatar(
                      radius: 35,
                      child: Image.file(File(controller.imagePath.value)),
                    ) : Container(),
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
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {
                    controller.uploadPostFirestore();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: const Text(
                      "Post",
                      style: TextStyle(color: secondaryColor, fontSize: 14),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
// Center(
// child: IconButton(
// onPressed: () {
// _showBottom(
// text: "Select gallery",
// onPressed: () {
// controller.getImageGallery();
// });
// },
// icon: const Icon(Icons.upload_outlined),
// ),
// )
// :
