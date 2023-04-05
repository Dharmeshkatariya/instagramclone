
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class SignUpController extends GetxController{
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final nameController = TextEditingController();
  final bioController = TextEditingController();
  RxBool isLoading = false.obs;
  RxString imagePath = "".obs;

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passController.dispose();
    bioController.dispose();
    nameController.dispose();
    super.dispose();
  }


}