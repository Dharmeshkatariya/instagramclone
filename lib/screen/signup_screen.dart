import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untitled/method/authmethod.dart';
import 'package:untitled/common.dart';
import 'package:untitled/controller/signup_controller.dart';
import 'package:untitled/routes/name_routes.dart';
import 'package:untitled/utills/colors.dart';

class SignUpScreen extends GetView<SignUpController> {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 37, vertical: 20),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/screen1/icon/instaflutter.svg",
                height: 64,
                color: primaryColor,
              ),
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(300),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: controller.imagePath.value.isEmpty
                          ? CircleAvatar(
                              radius: 65,
                              child: Image.network(
                                "https://t4.ftcdn.net/jpg/00/64/67/63/360_F_64676383_LdbmhiNM6Ypzb3FM4PPuFP9rHe7ri8Ju.jpg",
                                fit: BoxFit.cover,
                              ),
                            )
                          : Image.file(
                              File(controller.imagePath.value),
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  Positioned(
                      left: 70,
                      bottom: -10,
                      child: IconButton(
                        onPressed: () {
                          getImageGallery();
                        },
                        icon: const Icon(
                          Icons.add_a_photo,
                          color: Colors.blue,
                        ),
                      ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Common.textField(
                  text: "Enter your username",
                  controller: controller.nameController),
              const SizedBox(
                height: 10,
              ),
              Common.textField(
                  text: "Enter your Email",
                  controller: controller.emailController),
              const SizedBox(
                height: 10,
              ),
              Common.textField(
                  text: "Enter your Password",
                  sufIcon: const Icon(Icons.visibility),
                  controller: controller.passController,
                  teextVisible: true),
              const SizedBox(
                height: 10,
              ),
              Common.textField(
                  text: "Enter your bio", controller: controller.bioController),
              const SizedBox(
                height: 10,
              ),
              controller.isLoading.value
                  ? const CircularProgressIndicator()
                  : Common.button(
                      loading: controller.isLoading.value,
                      text: "Sign Up",
                      color: blueColor,
                      onTap: () {
                        controller.isLoading.value = true;
                        print('----');
                        AuthMethod().signUpUser(
                            imagepath: controller.imagePath.value,
                            email: controller.emailController.text,
                            password: controller.passController.text,
                            username: controller.nameController.text,
                            bio: controller.bioController.text);

                      }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buttonText(text: "Do you have account?"),
                  _buttonText(
                      text: "log in",
                      onTap: () {
                        Get.toNamed(NameRoutes.loginScreen);
                      },
                      fontWeight: FontWeight.bold),
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }

  getImageGallery() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    controller.imagePath.value = image!.path;
    print(controller.imagePath.value);
  }

  Widget _buttonText(
      {GestureTapCallback? onTap,
      required String text,
      FontWeight? fontWeight}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(
          text,
          style: TextStyle(fontWeight: fontWeight),
        ),
      ),
    );
  }
}
