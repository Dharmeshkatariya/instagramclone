import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/method/authmethod.dart';
import 'package:untitled/common.dart';
import 'package:untitled/controller/login_screen_controller.dart';
import 'package:untitled/routes/name_routes.dart';
import 'package:untitled/utills/colors.dart';

class LoginScreen extends GetView<LoginScreenController> {
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 37),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(flex: 1, child: Container()),
              SvgPicture.asset(
                "assets/screen1/icon/instaflutter.svg",
                height: 64,
                color: primaryColor,
              ),
              const SizedBox(
                height: 24,
              ),
              Common.textField(
                  text: "Enter your Email",
                  controller: controller.emailController),
              const SizedBox(
                height: 24,
              ),
              Common.textField(
                  text: "Enter your Password",
                  sufIcon: const Icon(Icons.visibility),
                  controller: controller.passController,
                  teextVisible: true),
              const SizedBox(
                height: 24,
              ),
              Common.button(
                  text: "Login",
                  color: blueColor,
                  onTap: () async {
                    var shareP = await SharedPreferences.getInstance();
                    shareP.setBool("login", true);
                    AuthMethod().loginUser(
                        email: controller.emailController.text,
                        password: controller.passController.text);
                    Get.toNamed(NameRoutes.mobileScreen);
                  }),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buttonText(text: "Don't have account"),
                  _buttonText(
                      text: "Sign up",
                      onTap: () {
                        Get.toNamed(NameRoutes.signUpScreen);
                      },
                      fontWeight: FontWeight.bold),
                ],
              ),
              Flexible(flex: 1, child: Container()),
            ],
          ),
        ),
      ),
    );
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
